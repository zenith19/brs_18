class User < ActiveRecord::Base
  has_many :comments
  has_many :requests
  has_many :reviews
  has_many :user_books
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
end