class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
    @search = Book.search params[:q]
    @books = @search.result.latest.page(params[:page]).per 10
  end

  def show
    @review = @book.reviews.build
    @reviews = @book.reviews.latest
  end
end
