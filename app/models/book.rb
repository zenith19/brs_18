class Book < ActiveRecord::Base
  belongs_to :category
  has_many :user_books
  has_many :reviews
  has_many :book_photos
end
