class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :driver_id
      t.datetime :leave_at, null: false
      t.string :leave_from, null: false
      t.string :route, null: false
      t.string :description
      t.timestamps
    end
  end
end
