class AddStatusDefaultToUserBooks < ActiveRecord::Migration
  def change
    change_column :user_books, :status, :integer, default: 0
  end
end