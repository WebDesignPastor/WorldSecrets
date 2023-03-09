class AddColumnsToItinerary < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :category, :string
    add_column :itineraries, :description, :text
  end
end
