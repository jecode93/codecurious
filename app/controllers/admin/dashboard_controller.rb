class Admin::DashboardController < Admin::AdminController
  def index
    @articles = Article.order(created_at: :desc).limit(6)
    @article_count = Article.count
    @author_count = Article.distinct.pluck(:author_id).count
    @total_articles_read = Article.sum(:read_count)
    @highest_read_count = Article.maximum(:read_count)
    @most_read_articles = Article.where(read_count: @highest_read_count).pluck(:title)
  end

  private

  def pundit_user
    current_admin
  end
end
