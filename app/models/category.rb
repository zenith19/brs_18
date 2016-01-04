class Category < ActiveRecord::Base
  include ImageValidation
  
  has_many :books

  validates :name,
    presence: true,
    length: {maximum: 30},
    uniqueness: {case_sensitive: false}

  mount_uploader :picture, ImageUploader

  validate :picture_size
end
