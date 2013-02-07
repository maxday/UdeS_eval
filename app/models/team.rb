class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :users
  has_many :affectations, :through => :users

  validates :name,
            :presence => true,
            :uniqueness => true
end
