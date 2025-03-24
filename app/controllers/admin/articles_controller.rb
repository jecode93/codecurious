class Admin::ArticlesController < Admin::AdminController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @pagy, @articles = pagy(Article.includes(:author).descending_order, limit: 15)
  end

  def show
  end

  def new
    @article = current_admin.articles.build
  end

  def create
    @article = current_admin.articles.build(article_params)
    if @article.save
      redirect_to [:admin, @article], notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @article, :manage?
  end

  def update
    authorize @article, :manage?
    if @article.update(article_params)
      redirect_to [:admin, @article], notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @article, :manage?
    @article.destroy
    redirect_to admin_articles_url, notice: "Article was successfully destroyed."
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_articles_path, alert: "Article Not found."
  end

  def article_params
    params.require(:article).permit(:title, :featured_image, :content, :status, category_ids: [])
  end

  def pundit_user
    current_admin
  end
end
