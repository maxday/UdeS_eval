class CreateAffectations < ActiveRecord::Migration
  def change
    create_table :affectations do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :term_id

      t.timestamps
    end
  end
end
