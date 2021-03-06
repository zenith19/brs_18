class Admin::BooksController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: [:new, :edit, :create]

  def index
    @categories = Category.all
    @books = Book.custom_search(params).page(params[:page]).per 10
  end

  def new
  end

  def create
    if BookService.new(@book).save
      flash[:success] = t "book_added_text"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if BookService.new(@book).update book_params
      flash[:success] = t "book_updated_text"
      redirect_to admin_books_path
    else
      render :edit
    end
  end

  def destroy
    BookService.new(@book).destroy
    flash[:success] = t "book_delete_message"
    redirect_to admin_books_path
  end

  private
  def book_params
    params.require(:book).permit :category_id, :title, :description,
      :author, :publish_date, :page,
      book_photos_attributes: [:id, :image, :image_cache, :remote_image_url, :_destroy]
  end

  def load_categories
    @categories = Category.all
  end
end
