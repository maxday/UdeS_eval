class AddYearToTerm < ActiveRecord::Migration
  def change
    add_column :terms, :year_id, :integer
  end
end
