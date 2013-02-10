class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :users
  has_many :affectations, :through => :users

  validates :name,
            :presence => true,
            :uniqueness => true

  def how_many?(term)
    return Affectation.where(:team_id => self, :team_id => term).count
  end
end
