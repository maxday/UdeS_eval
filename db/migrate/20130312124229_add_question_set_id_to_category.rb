class AddQuestionSetIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :questionset_id, :integer
  end
end
