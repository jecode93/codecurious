class Admin::ProfilesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: %i[edit update index ]

  def index
    @admin_articles = current_admin.articles.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @admin.update(set_params)
      redirect_to admin_profiles_path(@admin), notice: "Admin index was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_admin
    @admin = current_admin
  end

  def set_params
    params.require(:admin).permit(:profile_picture, :website, :whatsapp_number, :github, :linkedin, :facebook, :instagram)
  end
end
