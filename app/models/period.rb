class Period < ActiveRecord::Base
  attr_accessible :name, :term_id

  validates :name,
            :presence => true

end
