class Affectation < ActiveRecord::Base
  attr_accessible :team_id, :term_id, :user_id

  validates_uniqueness_of :team_id, :scope => [:term_id, :user_id]
end
