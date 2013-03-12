class RemovePeriodIdFromEntry < ActiveRecord::Migration
  def up
    remove_column :entries, :period_id
      end

  def down
    add_column :entries, :period_id, :integer
  end
end