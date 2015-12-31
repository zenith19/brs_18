class Admin::BooksController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: [:new, :edit]

  def new
  end

  def create
    if @book.save
      flash[:success] = t "book_added_text"
      redirect_to request.referrer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "book_updated_text"
      redirect_to new_admin_book_path
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit :category_id, :title, :author, :publish_date,
      :page, book_photos_attributes: [:id, :image, :_destroy]
  end

  def load_categories
    @categories = Category.all
  end
end
