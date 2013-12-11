class FixingIdAutoIncrementUser < ActiveRecord::Migration
  def change
  	drop_table :users
  	create_table :users do |t|
  		t.string "privilege", :limit =>10
  		t.timestamps
  	end

  end
end
