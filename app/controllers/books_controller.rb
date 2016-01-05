class BooksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @categories = Category.all
    @search = Book.search params[:q]
    @books = @search.result.latest.page(params[:page]).per 10
  end

  def show
    @review = @book.reviews.build
    @reviews = @book.reviews.latest
    @comment = current_user.comments.build
  end
end
