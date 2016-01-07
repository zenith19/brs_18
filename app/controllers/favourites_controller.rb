class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def update
    @user_book = UserBook.find params[:id]
    FavouriteService.new(@user_book).update book_params
    respond_to do |format|
      format.js
    end
  end

  private
  def book_params
    params.require(:user_book).permit :favourite
  end
end
