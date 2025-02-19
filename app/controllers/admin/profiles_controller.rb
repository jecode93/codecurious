class Admin::ProfilesController < Admin::AdminController
  before_action :set_admin, only: %i[show edit update]
  before_action :set_admin_profile, only: %i[edit update]

  def show
    @admin_articles = Article.order(created_at: :desc)
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
    @admin = Admin.find(params[:id])
  end

  def set_admin_profile
    if params[:id] != current_admin.friendly_id
      redirect_to profile_path, alert: "You do not have permission to do this action." and return
    end
  end

  def set_params
    params.require(:admin).permit(:name, :bio, :profile_picture, :website, :whatsapp_number, :github, :linkedin, :facebook, :instagram)
  end
end
