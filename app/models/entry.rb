class Entry < ActiveRecord::Base
  attr_accessible :period_id, :real_value, :visible_value

  belongs_to :period
end
