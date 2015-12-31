class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if CategoryService.new(@category).save
      flash[:success] = t "add_category_sucessful_message"
      redirect_to new_admin_category_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :picture
  end
end
