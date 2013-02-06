class Year < ActiveRecord::Base
  attr_accessible :name

  has_many :terms

  validates :name,
            :presence => true,
            :uniqueness => true
end
