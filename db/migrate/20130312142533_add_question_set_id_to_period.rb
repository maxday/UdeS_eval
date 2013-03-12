class AddQuestionSetIdToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :questionset_id, :integer
  end
end
