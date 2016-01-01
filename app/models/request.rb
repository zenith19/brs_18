class Request < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :publisher
  validates_presence_of :link
  enum status: [:pending, :cancel, :approved, :not_approved]
end
