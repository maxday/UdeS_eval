class Category < ActiveRecord::Base
  attr_accessible :name, :questionset_id
  has_many :questions
  belongs_to :questionsets

  validates :name,
            :presence => true

  validates_uniqueness_of :name, :scope => [:name, :questionset_id]

  default_scope :order => "name"
end
