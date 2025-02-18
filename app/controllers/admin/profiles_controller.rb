class Admin::ProfilesController < Admin::AdminController
  before_action :set_admin, only: %i[show edit update]

  def show
    @admin_articles = current_admin.articles.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @admin.update(set_params)
      redirect_to profile_path(@admin), notice: "Admin info was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_admin
    @admin = current_admin
  end

  def set_params
    params.require(:admin).permit(:name, :bio, :profile_picture, :website, :whatsapp_number, :github, :linkedin, :facebook, :instagram)
  end
end
