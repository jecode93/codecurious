class AuthorsController < ApplicationController
  def show
    @author = Admin.find(params[:id])
    @articles = @author.articles.order(created_at: :desc)
  end
end
