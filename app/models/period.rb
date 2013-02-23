class Period < ActiveRecord::Base
  attr_accessible :name, :term_id, :begin_date, :due_date

  validates :name, :term_id,
            :presence => true

  belongs_to :terms
  has_many :marks
  has_many :entries


  def fullname
    term = Term.find(self.term_id)
    fullname = "#{Year.find(term.year_id).name} - #{term.name} - #{self.name}"
  end

  def all_question
    return Question.where(:period_id => self)
  end

  default_scope :order => "due_date DESC"

end


