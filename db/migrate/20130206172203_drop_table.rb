class DropTable < ActiveRecord::Migration
  def up
    drop_table :quarters
  end
end
