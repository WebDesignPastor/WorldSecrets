class Itinerary < ApplicationRecord
  belongs_to :city
  has_many :itinerary_pois, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :pois, through: :itinerary_pois
  has_many :trips
  has_many_attached :photos
end
