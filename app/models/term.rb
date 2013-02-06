class Term < ActiveRecord::Base
  attr_accessible :name, :year_id

  belongs_to :years

  validates :name,
            :presence => true,
            :uniqueness => true

  validates :year_id,
            :presence => true
end
