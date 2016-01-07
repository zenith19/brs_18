class ReadingStatusesController < ApplicationController
  before_action :authenticate_user!

  def update
    @user_book = UserBook.find params[:id]
    ReadingStatusService.new(@user_book).update user_book_params
    respond_to do |format|
      format.html {redirect_to @user_book.book}
      format.js {}
    end
  end

  private
  def user_book_params
    params.require(:user_book).permit :status
  end
end
