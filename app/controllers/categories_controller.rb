class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @pagy, @category_articles = pagy(@category.articles.published.descending_order)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to articles_path, alert: "Category not found"
  end
end
