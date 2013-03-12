class AddQuestionSetIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :questionset_id, :integer
  end
end
