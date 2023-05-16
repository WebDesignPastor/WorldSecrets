class AddFavoriteToItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :favorite, :boolean, default: false
  end
end
