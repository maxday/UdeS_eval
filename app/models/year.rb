class Year < ActiveRecord::Base
  attr_accessible :name

  has_many :terms

  validates :name,
            :presence => true,
            :uniqueness => true


  default_scope :order => "name DESC"

end
