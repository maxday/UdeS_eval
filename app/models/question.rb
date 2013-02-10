class Question < ActiveRecord::Base
  attr_accessible :name, :category_id

  belongs_to :categories;

  validates :name,
            :presence => true

  def all_answsers?(student, period)
    return Mark.where(:question_id => self, :student_to_id => student, :period_id => period)
  end
end
