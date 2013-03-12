class AddStudentsetIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :studentset_id, :integer
  end
end
