class Questionset < ActiveRecord::Base
  attr_accessible :name

  has_many :categories
  has_many :entries

end