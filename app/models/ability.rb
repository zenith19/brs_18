class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:edit, :update], User, id: user.id
      can :create, Request
      can :update, Request do |request|
        request.try(:user) == user
      end
      can :create, Review
      can :destroy, Review, user_id: user.id
    end
  end
end
