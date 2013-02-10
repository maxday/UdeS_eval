class AddPeriodIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :period_id, :integer
  end
end