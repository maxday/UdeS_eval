class CreateStudentsets < ActiveRecord::Migration
  def change
    create_table :studentsets do |t|
      t.string :name

      t.timestamps
    end
  end
end
