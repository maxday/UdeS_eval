class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :questions

  validates :name,
            :presence => true,
            :uniqueness => true

  default_scope :order => "name"
end
