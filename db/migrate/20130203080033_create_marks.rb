class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :student_from_id
      t.integer :student_to_id
      t.integer :question_id
      t.integer :period_id
      t.integer :value

      t.timestamps
    end
  end
end
