class Book < ActiveRecord::Base
  belongs_to :category
  has_many :user_books
  has_many :reviews
  has_many :book_photos, dependent: :destroy

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :author, presence: true
  validates :page, presence: true, numericality: {minimum: 1}
  validates :publish_date, presence: true
  validates :category, presence: true

  accepts_nested_attributes_for :book_photos, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:image].blank?}

  scope :latest, -> {order "created_at DESC"}
  scope :favourite, -> user_id{joins(:user_books).where user_books: 
    {user_id: user_id, favourite: true}}
end
