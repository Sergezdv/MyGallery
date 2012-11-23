class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def category_list
    @category = Category.find(params[:category_id])
    @pictures = Picture.find_all_by_category_id(params[:category_id])
  end

  def rand_method
    render :text => Picture.find_all_by_category_id(params[:category_id]).sample(1).first.image.url(:thumb)
  end

  def show_image
    @picture = Picture.find(params[:category_id])
  end

end
