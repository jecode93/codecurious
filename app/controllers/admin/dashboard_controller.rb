class Admin::DashboardController < Admin::AdminController
  def index
    @articles = Article.published.order(created_at: :desc).limit(6)
    @article_count = Article.published.count
    @author_count = Article.published.distinct.pluck(:author_id).count
    @total_articles_read = Article.published.sum(:read_count)
    @highest_read_count = Article.published.maximum(:read_count)
    @most_read_articles = Article.published.where(read_count: @highest_read_count).pluck(:title)
  end

  private

  def pundit_user
    current_admin
  end
end
