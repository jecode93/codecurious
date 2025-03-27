class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @categories = pagy(Category.includes(:admin).order(name: :asc))
  end

  def show
    @category_articles = @category.articles
  end

  def new
    @category = current_admin.categories.build
  end

  def create
    @category = current_admin.categories.build(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_categories_path, alert: "Category not found."
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
