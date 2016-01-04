class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_many :comments

  validates :book,
    presence: true,
    uniqueness: {scope: :user}
  validates :content,
    presence: true,
    length: {minimum: 5}
end
