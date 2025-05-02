class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @q = Article.ransack(params[:q])
    @pagy, @articles = pagy(@q.result(distinct: true).includes(:author, :article_categories).published.descending_order, limit: 18)

    # Only redirect if this was a search AND there are no results
    if @articles.empty? && params[:q].present?
      flash[:alert] = "No article found for your search criteria."
      redirect_to root_path
    end

  rescue Pagy::OverflowError
    redirect_to root_path(page: 1)
  end

  def show
    @related_articles = Article.published.where.not(id: @article.id).descending_order.limit(4)
    @article.article_read_counts.create(read_at: Time.current)
    @article.increment!(:read_count)

    image_url = @article.featured_image.attached? ? url_for(@article.featured_image) : nil
    set_meta_tags title: @article.title, description: @article.content.to_s, og: {
      title: :title, description: :description, image: image_url, url: article_url(@article)
    }, type: "article"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, notice: "Article not found."
  end
end
