class BooksController < ApplicationController
  load_and_authorize_resource
  
  def index
    @books = @books.latest.page(params[:page]).per 10
  end
end
