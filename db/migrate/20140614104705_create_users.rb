class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :profile_image, null: false
      t.datetime :leave_after, null: false
      t.datetime :leave_before, null: false
      t.string :destination_address, null: false
      t.float :dest_lat
      t.float :dest_long
      t.boolean :has_car, default: false
      t.integer :car_spots, default: 0
      t.integer :group_id
      t.timestamps
    end

    add_index :users, :leave_after
    add_index :users, :leave_before
    add_index :users, :group_id
  end
end
