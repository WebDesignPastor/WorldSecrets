class Trip < ApplicationRecord
  belongs_to :user
  has_many :questions, through: :itineraries
  belongs_to :itinerary
  geocoded_by :departure
end
