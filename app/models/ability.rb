class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, [Request, Review, Comment, Like]
      can [:edit, :update], User, id: user.id
      can :destroy, Like
      can :update, Request do |request|
        request.try(:user) == user
      end
      can :update, UserBook
      can [:edit, :update, :destroy], [Review, Comment], user_id: user.id
    end
  end
end
