class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :administrator
      can :manage, Project
    elsif user.role? :supervisor
      can [:read, :update, :create], Project
    else
      can :manage, :none
    end
  end
end