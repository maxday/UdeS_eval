class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :period_id
      t.string :visible_value
      t.integer :real_value

      t.timestamps
    end
  end
end
