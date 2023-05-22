class RemoveNotNecessariesColumnsToTripsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :proximity_level
    remove_column :trips, :status
    remove_column :trips, :progress
  end
end
