class AddCompletedToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :completed, :boolean, default: false
  end
end
