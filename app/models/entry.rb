class Entry < ActiveRecord::Base
  attr_accessible :period_id, :real_value, :visible_value, :questionset_id

  belongs_to :period
  belongs_to :questionset
end
