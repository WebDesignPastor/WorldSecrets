class AddCompletedToItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :completed, :boolean, default: false
  end
end
