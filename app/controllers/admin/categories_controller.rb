class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.page(params[:page]).per 10
  end

  def new
  end

  def create
    if CategoryService.new(@category).save
      flash[:success] = t "add_category_sucessful_message"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if CategoryService.new(@category).update category_params
      flash[:success] = t "update_category_sucessful_message"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    CategoryService.new(@category).destroy
    flash[:success] = t "category_delete_message"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :picture
  end
end
