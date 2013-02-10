class Period < ActiveRecord::Base
  attr_accessible :name, :term_id, :begin_date, :due_date

  validates :name, :term_id,
            :presence => true

  belongs_to :terms
  has_many :marks


  def fullname
    term = Term.find(self.term_id)
    fullname = "#{Year.find(term.year_id).name} - #{term.name} - #{self.name}"
  end
end


