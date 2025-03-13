class Admin::ProfilesController < Admin::AdminController
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.all
  end

  def show
    @articles = Article.order(created_at: :desc)
    @admin_articles = Article.where(author_id: @admin.id).order(created_at: :desc)
  end

  def new
    authorize current_admin, :super_admin?
    @admin = Admin.new
  end

  def create
    authorize current_admin, :super_admin?
    @admin = Admin.new(set_params)
    if @admin.save
      redirect_to profiles_path, notice: "Admin was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @admin, :manage?
  end

  def update
    authorize @admin, :manage?

    # Prevent regular admins from changing the role
    if current_admin.super_admin? && @admin.update(set_params)
      redirect_to profile_path(@admin), notice: "Admin info was successfully updated."
    else
      # If a regular admin is trying to change the role, strip it from the params
      @admin.assign_attributes(set_params.except(:role))

      if @admin.save
        redirect_to profile_path(@admin), notice: "Profile updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    authorize @admin, :super_admin?
    @admin.destroy
    redirect_to profile_path, notice: "Account was successfully destroyed."
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def set_params
    params.require(:admin).permit(:email, :password, :name, :bio, :profile_picture, :website, :whatsapp_number, :github, :linkedin, :facebook, :instagram, :role)
  end

  def pundit_user
    current_admin
  end
end
