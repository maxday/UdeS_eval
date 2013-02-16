class Term < ActiveRecord::Base
  attr_accessible :name, :year_id, :is_active

  belongs_to :years
  has_many :periods

  validates :name,
            :presence => true

  validates :year_id,
            :presence => true

  validates_uniqueness_of :name, :scope => [:name, :year_id]

  def fullname
    fullname = "#{Year.find(self.year_id).name} - #{self.name}"
  end

  def activate
    Term.update_all(:is_active => false)
    Term.update(self, :is_active => true)
  end

end
