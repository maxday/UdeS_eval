class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :matricule, :string #to avoid 09876 -> 9876
    add_column :users, :fullname, :string #name and firstname split by a coma
  end
end
