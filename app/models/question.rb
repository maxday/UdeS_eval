class Question < ActiveRecord::Base
  attr_accessible :name, :category_id

  belongs_to :categories;

  validates :name,
            :presence => true
end
