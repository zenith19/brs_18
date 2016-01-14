class ReadingStatusService
  def initialize user_book, user = nil
    @user_book = user_book
    @user = user
  end

  def update user_book_params
    if @user_book.update_attributes user_book_params
      user_book_status_activity user_book_params
      true
    else
      false
    end
  end

  private
  def user_book_status_activity user_book_params
    if user_book_params[:status] == UserBook.statuses.keys[1]
      @user_book.create_activity key: "UsersBook.reading", owner: @user
    else
      @user_book.create_activity key: "UsersBook.read", owner: @user
    end
  end
end
