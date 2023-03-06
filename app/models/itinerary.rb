class Itinerary < ApplicationRecord
  belongs_to :city
  has_many :itinerary_pois
  has_many :questions
  has_many :trips
end
