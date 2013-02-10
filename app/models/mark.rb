class Mark < ActiveRecord::Base
  attr_accessible :student_from_id

  belongs_to :students
  belongs_to :students
  belongs_to :questions
  belongs_to :periods

end
