class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  scope :only_students, where(:name => "Student")

end