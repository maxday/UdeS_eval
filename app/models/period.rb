class Period < ActiveRecord::Base
  attr_accessible :name, :term_id, :begin_date, :due_date

  validates :name, :term_id,
            :presence => true

end
