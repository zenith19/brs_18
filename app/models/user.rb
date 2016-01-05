class User < ActiveRecord::Base
  include ImageValidation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :books
  has_many :comments
  has_many :requests
  has_many :reviews
  has_many :user_books
  has_many :books, through: :user_books
  has_many :activities
  has_many :likes
  has_many :active_relationships,
            class_name: Relationship.name,
            foreign_key: :follower_id,
            dependent: :destroy
  has_many :passive_relationships,
            class_name: Relationship.name,
            foreign_key: :followed_id,
            dependent: :destroy
  has_many :following,
            through: :active_relationships,
            source: :followed
  has_many :followers,
            through: :passive_relationships,
            source: :follower
  has_many :books, through: :user_books

  mount_uploader :picture, ImageUploader
  validate :picture_size

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    following.include? other_user
  end

  def followed_by? other_user
    followers.include? other_user
  end

  scope :review_activities, ->(user){PublicActivity::Activity.
    order(created_at: :desc).where "trackable_type = ? AND owner_id = ?",
    "Review", user.id}
end
