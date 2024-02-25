class DropTableTripAnswers < ActiveRecord::Migration[7.0]
  def change
    drop_table :trip_answers
  end
end
