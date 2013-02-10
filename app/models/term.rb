class Term < ActiveRecord::Base
  attr_accessible :name, :year_id

  belongs_to :years
  has_many :periods

  validates :name,
            :presence => true,
            :uniqueness => false

  validates :year_id,
            :presence => true
end
