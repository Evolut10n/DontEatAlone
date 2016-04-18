class AddUserInformation < ActiveRecord::Migration
  def change
  	add_column :users, :age, :integer
  	add_column :users, :gender, :string
  	add_column :users, :fullname, :string
  	add_column :users, :familyStatus, :string
  	add_column :users, :about, :text
  end
end
