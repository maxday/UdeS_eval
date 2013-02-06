class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :administrator
      can :manage, :none
      can :manage, Team
      can :manage, Term
      can :manage, Question

    elsif user.role? :supervisor
      can :manage, :none
      can [:read, :create], [Team, Term, Question]
    else
      can :manage, :none
      can :read, [Team, Term, Question]
    end
  end
end