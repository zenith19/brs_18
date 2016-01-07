class ReadingStatusService
  def initialize user_book
    @user_book = user_book
  end

  def update user_book_params
    if @user_book.update_attributes user_book_params
      true
    else
      false
    end
  end
end
