class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :administrator
      can :manage, :none
      can :manage, Project
      can :manage, Quarter
      can :manage, Question

    elsif user.role? :supervisor
      can :manage, :none
      can [:read, :create], [Project, Quarter, Question]
    else
      can :manage, :none
      can :read, [Project, Quarter, Question]
    end
  end
end