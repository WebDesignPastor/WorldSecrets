class ItineraryPoi < ApplicationRecord
  belongs_to :itinerary
  belongs_to :poi
end
