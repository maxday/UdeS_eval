class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :questionsets do |t|
      t.string :name

      t.timestamps
    end
  end
end