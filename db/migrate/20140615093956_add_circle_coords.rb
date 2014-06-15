class AddCircleCoords < ActiveRecord::Migration
  def change
    add_column :groups, :circle_center_long, :float, default: 13.393171
    add_column :groups, :circle_center_lat, :float, default: 52.505891
    add_column :groups, :circle_radius, :float, default: 200
  end
end
