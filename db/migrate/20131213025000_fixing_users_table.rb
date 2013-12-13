class FixingUsersTable < ActiveRecord::Migration
  def change
  	drop_table :users
  	create_table :users do |t|
  		t.string :netid, :unique =>true, :null =>false, :limit => 30
  		t.string :remember_token, :limit => 50
  		t.string :privilege, :limit =>10
  		t.timestamps
  	end

  end
end