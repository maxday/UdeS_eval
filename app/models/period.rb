class Period < ActiveRecord::Base
  attr_accessible :name, :term_id, :begin_date, :due_date, :questionset_id

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
    logger.info "ici"
    return Question.where(:category_id => Category.where(:questionset_id => self.questionset_id))
  end

  default_scope :order => "due_date DESC"

end


