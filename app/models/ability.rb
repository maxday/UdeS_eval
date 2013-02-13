class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :administrator
      can :manage, :none
      can :manage, [Team, Term, Question, Year, Period, Affectation, Category]
      can :check, :evaluation
      can :upload, :create

    elsif user.role? :supervisor
      can :manage, :none
      can [:read, :create, :edit], [Team, Term, Question, Year, Period, Affectation, Category]
      can :read, Mark
      can :check, :evaluation

    else
      can :manage, :none
      can :read, [Question]
      can :create, [Mark]
    end
  end
end