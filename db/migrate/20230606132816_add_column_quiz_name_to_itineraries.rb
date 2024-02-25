class AddColumnQuizNameToItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :quiz_name, :string
  end
end
