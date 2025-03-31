class Admin::ProfilesController < Admin::AdminController
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.all
  end

  def show
    @articles = Article.includes(:author).descending_order
    @pagy, @admin_articles = pagy(@articles.where(author_id: @admin.id), limit: 10)
  end

  def new
    authorize current_admin, :super_admin?
    @admin = Admin.new
  end

  def create
    authorize current_admin, :super_admin?

    generated_password = Devise.friendly_token.first(8)
    @admin = Admin.new(set_params.merge(password: generated_password))

    if @admin.save
      AdminMailer.welcome_email(@admin, generated_password).deliver_later
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
      redirect_to profiles_path, notice: "Admin info was successfully updated."
    else
      # If a regular admin is trying to change the role, strip it from the params
      @admin.assign_attributes(set_params.except(:role))

      # Handle password update securely
      if password_params[:password].present? && password_params[:password_confirmation].present?
        # Check if the current password is correct before updating
        if @admin.update_with_password(password_params)
          bypass_sign_in(@admin) # Keep the admin logged in after password change
          redirect_to profiles_path, notice: "Profile updated successfully, password changed."
        else
          render :edit, status: :unprocessable_entity
        end
      else
        # If no password fields, update without changing password
        if @admin.save
          redirect_to profiles_path, notice: "Profile updated successfully."
        else
          render :edit, status: :unprocessable_entity
        end
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
    params.require(:admin).permit(:email, :name, :bio, :profile_picture, :website, :whatsapp_number, :github, :linkedin, :facebook, :instagram, :role)
  end

  def password_params
    params.require(:admin).permit(:current_password, :password, :password_confirmation)
  end

  def pundit_user
    current_admin
  end
end