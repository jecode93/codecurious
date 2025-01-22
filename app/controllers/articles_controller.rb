class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @pagy, @articles = pagy(Article.descending_order, limit: 12)
  end

  def show
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
