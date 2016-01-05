class ChangeFavouriteToUserBooks < ActiveRecord::Migration
  def change
    change_column_default :user_books, :favourite, false
  end
end
