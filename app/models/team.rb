class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :users
  has_many :affectations, :through => :users

  validates :name,
            :presence => {:message => "Le nom de l'equipe ne peut pas etre vide"},
            :uniqueness => {:message => "Le nom de l'equipe doit etre unique"}


  def how_many?(term)
    return Affectation.where(:team_id => self, :team_id => term).count
  end

  def all_members?(term)
    return Affectation.where(:team_id => self, :term_id => term)
  end

  def all_members_but_me?(term, user)
    return Affectation.where(:team_id => self, :term_id => term).where(['user_id <> ?', user.id])
  end

end
