class AddIsActiveToTerm < ActiveRecord::Migration
  def change
    add_column :terms, :is_active, :boolean
  end
end
