class AddSubtitleToItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :subtitle, :string
  end
end
