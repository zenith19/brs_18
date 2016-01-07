class FavouriteService
  def initialize user_book
    @user_book = user_book
  end

  def update book_params
    if @user_book.update_attributes book_params
      true
    else
      false
    end
  end
end
