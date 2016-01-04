class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  include PublicActivity::Model
  tracked except: [:destroy, :update],
    owner: ->(controller, model) {controller && controller.current_user}
end
