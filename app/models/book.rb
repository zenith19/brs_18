require "elasticsearch/model"

class Book < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :category
  belongs_to :user
  has_many :user_books
  has_many :reviews
  has_many :book_photos, dependent: :destroy
  has_many :users, through: :user_books
  belongs_to :user

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  after_initialize :init_rating

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  # validates :description, presence: true
  validates :author, presence: true
  validates :page, presence: true, numericality: {minimum: 1}
  validates :publish_date, presence: true
  validates :category, presence: true
  validates :book_photos, presence: true

  accepts_nested_attributes_for :book_photos, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:image].blank?}

  scope :latest, -> {order "created_at DESC"}
  scope :favourite, -> user_id{joins(:user_books)
                       .where user_books: {user_id: user_id, favourite: true}}
  scope :not_favourite, -> user_id{where.not id: [(favourite user_id).ids]}
  #
  # scope :filter_book, ->(criteria) do
  #   search = criteria.split
  #   case search[0]
  #   when "all"
  #     Book.all
  #   when "unfavourite"
  #     not_favourite search[1].to_i
  #   else
  #     favourite search[1].to_i
  #   end
  # end

  class << self
    def custom_search params
      query=params[:query]
      category=params[:category]
      if category
        self.__elasticsearch__.search(query: {match: {category_id: category}})
          .records
      elsif query
        advanced = process_advanced query
        if advanced
          self.__elasticsearch__.search(query: {match:
            {advanced[0] => advanced[1]}}).records
        else
          self.__elasticsearch__.search(query).records
        end
      else
        self.all
      end
    end

    def process_advanced query
      if query =~ /^(title|rating):/
        key = query.split ":"
        key[1]=key[1].strip
        key
      end
    end
  end

  private
  # class << self
  #   def ransackable_scopes auth_object = nil
  #     [:filter_book]
  #   end
  # end

  def init_rating
    self.rating = 0 if self.rating.nil?
  end
end

Book.import
