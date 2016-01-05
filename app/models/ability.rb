class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, [Request, Review, Comment]
      can [:edit, :update], User, id: user.id
      can :update, Request do |request|
        request.try(:user) == user
      end
      can :destroy, Review, user_id: user.id
    end
  end
end
