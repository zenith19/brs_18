class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  validates :follower, presence: true
  validates :followed, presence: true

  include PublicActivity::Model
  tracked except: [:update],
    owner: ->(controller, model) {controller && controller.current_user}
end
