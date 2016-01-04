class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  include PublicActivity::Model
  tracked except: [:destroy, :update],
    owner: ->(controller, model) {controller && controller.current_user}
end
