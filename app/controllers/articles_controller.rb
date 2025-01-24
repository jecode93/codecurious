class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @q = Article.ransack(params[:q])
    @pagy, @articles = pagy(@q.result.descending_order, limit: 12)

    # Handle the case when there is no record found
    if @articles.empty?
      flash[:alert] = "No records found for your search criteria."
      redirect_to root_path
    end

  rescue Pagy::OverflowError
    redirect_to root_path(page: 1)
  end

  def show
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
