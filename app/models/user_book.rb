class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  enum status: [:not_read, :reading, :finished]
  
  scope :by_user, ->user_id {where user_id: user_id}

  include PublicActivity::Model
  tracked except: [:create, :destroy],
    owner: ->(controller, model) {controller && controller.current_user}

end
