class CreateItineraryPois < ActiveRecord::Migration[7.0]
  def change
    create_table :itinerary_pois do |t|
      t.string :poi_order
      t.references :itinerary, null: false, foreign_key: true
      t.references :poi, null: false, foreign_key: true

      t.timestamps
    end
  end
end
