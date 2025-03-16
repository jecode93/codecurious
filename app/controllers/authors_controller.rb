class AuthorsController < ApplicationController
  def show
    @author = Admin.find(params[:id])
    @pagy, @articles = pagy(@author.articles.order(created_at: :desc), limit: 10)
  end
end
