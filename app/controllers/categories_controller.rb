class CategoriesController < ApplicationController
    def show
        @category = Category.find(params[:id])
        @q =Article.where(category_id: @category.id).ransack(params[:q])
        @articles = @q.result(distinct: true)
        @categories = Category.all
    end
end
