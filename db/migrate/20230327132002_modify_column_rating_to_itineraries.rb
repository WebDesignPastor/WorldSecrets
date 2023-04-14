class ModifyColumnRatingToItineraries < ActiveRecord::Migration[7.0]
  def change
    remove_column :itineraries, :rating, :float
    add_column :itineraries, :rates, :integer, default: [], array: true
  end
end
