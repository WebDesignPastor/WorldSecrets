class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_answers
  belongs_to :itinerary
end
