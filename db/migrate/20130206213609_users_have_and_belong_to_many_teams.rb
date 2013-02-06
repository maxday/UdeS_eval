class UsersHaveAndBelongToManyTeams < ActiveRecord::Migration
  def change
    create_table :teams_users, :id => false do |t|
      t.references :team, :user
      t.integer :term_id
    end
  end
end