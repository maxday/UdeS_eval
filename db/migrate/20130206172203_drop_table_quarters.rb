class DropTableQuarters < ActiveRecord::Migration
  def change
    drop_table :quarters
  end
end
