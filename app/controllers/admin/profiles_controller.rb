class Admin::ProfilesController < Admin::AdminController
  before_action :set_admin, only: %i[show edit update]

  def show
    @articles = Article.order(created_at: :desc)
    @admin_articles = Article.where(author_id: @admin.id).order(created_at: :desc)
  end

  def edit
    authorize @admin, :manage?
  end

  def update
    authorize @admin, :manage?

    if @admin.update(set_params)
      redirect_to profile_path(@admin), notice: "Admin info was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def set_params
    params.require(:admin).permit(:name, :bio, :profile_picture, :website, :whatsapp_number, :github, :linkedin, :facebook, :instagram)
  end

  def pundit_user
    current_admin
  end
end
