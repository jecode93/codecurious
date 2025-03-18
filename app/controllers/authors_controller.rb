class AuthorsController < ApplicationController
  def show
    @author = Admin.find(params[:id])
    @pagy, @articles = pagy(@author.articles.published.descending_order, limit: 10)
  end
end
