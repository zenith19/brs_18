class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user
      can :read, :all
      can :create, [Request, Review, Comment, Like, Relationship]
      can [:edit, :update], User, id: user.id
      can :destroy, [Like, Relationship]
      can :update, Request do |request|
        request.try(:user) == user
      end
      can :update, UserBook
      can [:edit, :update, :destroy], [Review, Comment], user_id: user.id
    else
      can :read, [Book, Category, Review, Comment]
    end
  end
end
