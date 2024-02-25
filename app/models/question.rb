class Question < ApplicationRecord
  belongs_to :itinerary
  has_many :trips, through: :itineraries
end
