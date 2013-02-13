class Mark < ActiveRecord::Base
  attr_accessible :student_from_id, :student_to_id, :value, :question_id, :period_id

  belongs_to :students
  belongs_to :students
  belongs_to :questions
  belongs_to :periods

  validate :validate_mark_cheat

  def validate_mark_cheat
    if (self.student_from_id == self.student_to_id)
      errors.add(:student_from_id, "a mark can't be self-asign")
      errors.add(:student_to_id, "a mark can't be self-asign")
    end
  end

end
