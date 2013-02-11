class Term < ActiveRecord::Base
  attr_accessible :name, :year_id

  belongs_to :years
  has_many :periods

  validates :name,
            :presence => true

  validates :year_id,
            :presence => true

  validates_uniqueness_of :name, :scope => [:name, :year_id]


end
