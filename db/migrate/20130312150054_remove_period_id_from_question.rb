class RemovePeriodIdFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :period_id
      end

  def down
    add_column :questions, :period_id, :integer
  end
end
