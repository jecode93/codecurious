class Admin::DashboardController < Admin::AdminController
  def index
    @articles = Article.order(created_at: :desc).limit(6)
    @article_count = Article.count
    @author_count = Article.distinct.pluck(:author_id).count
  end

  private

  def pundit_user
    current_admin
  end
end
