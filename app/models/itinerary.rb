class Itinerary < ApplicationRecord
  belongs_to :city
  has_many :itinerary_pois, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :pois, through: :itinerary_pois
  has_many :trips
  has_many :bookmarks
  has_many :users, through: :bookmarks
  has_many_attached :photos
  geocoded_by :departure

  attribute :rates, :integer, default: [], array: true

  after_validation :geocode, if: :will_save_change_to_departure?
end
