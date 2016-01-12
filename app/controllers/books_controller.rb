class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
    if params[:query].blank?
      @books = Book.page(params[:page]).per 10
    else
      @books = Book.search(params[:query]).records.page(params[:page]).per 10
    end
  end

  def show
    @review = @book.reviews.build if user_signed_in?
    @reviews = @book.reviews.latest
    @comment = current_user.comments.build if user_signed_in?
    @user_book = UserBook.find_or_create_by user_id: current_user.id,
      book_id: @book.id if user_signed_in?
  end
end
