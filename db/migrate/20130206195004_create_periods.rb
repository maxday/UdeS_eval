class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :name
      t.integer :term_id
      t.date :begin_date
      t.date :due_date
      t.timestamps
    end
  end
end
