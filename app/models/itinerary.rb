class Itinerary < ApplicationRecord
  belongs_to :city
  has_many :itinerary_pois
  has_many :questions, dependent: :destroy
  has_many :pois, through: :itinerary_pois
  has_many :trips
end
