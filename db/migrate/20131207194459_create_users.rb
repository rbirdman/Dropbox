class CreateUsers < ActiveRecord::Migration
  def change
    change_table :Users do |t|
      t.timestamps
    end
  end
end
