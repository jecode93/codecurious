class Admin::DashboardController < Admin::AdminController
  def index
    base_query = Article.published

    @articles = base_query.includes(:author).order(created_at: :desc).limit(6)
    @article_count = base_query.count
    @author_count = base_query.distinct.count(:author_id)
    @total_articles_read = base_query.sum(:read_count)
    @highest_read_count = base_query.maximum(:read_count)
    @most_read_articles = base_query.where(read_count: @highest_read_count).pluck(:title)
  end

  private

  def pundit_user
    current_admin
  end
end
