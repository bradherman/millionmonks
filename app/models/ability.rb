class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :create, [User, UserSession]
    can :read, :all
       
    if user.admin?
      can :manage, :all
    elsif user.login # user exists
      can [:update, :destroy], User do |u|
        u.id == user.id
      end
      can [:update, :destroy], Wisdom do |w|
        user.id == w.user_id
      end
      can :create, Wisdom
      can :destroy, UserSession
    end
  end
end