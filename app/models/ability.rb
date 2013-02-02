class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :administrator
      can :manage, :none
      can :manage, Project
    elsif user.role? :supervisor
      can :manage, :none
      can :read, Project
    else
      can :manage, :none
      can :read, Project
    end
  end
end