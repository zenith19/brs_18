class FavouriteService
  def initialize user_book, user = nil
    @user_book = user_book
    @user = user
  end

  def update book_params
    if @user_book.update_attributes book_params
      favourite_user_book_activity book_params
      true
    else
      false
    end
  end

  private
  def favourite_user_book_activity book_params
      @user_book.create_activity key: "UsersBook.favourite", owner: @user
  end
end
