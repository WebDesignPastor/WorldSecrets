class Poi < ApplicationRecord
  has_many :itinerary_pois, dependent: :destroy

  # Validates :name, presence: true, uniqueness: true
  # Validates :address, presence: true, uniqueness: true
  # Validates :mystery_name, presence: true, uniqueness: true
  # Validates :mystery_content, presence: true
  # Validates :mystery_image, presence: true, uniqueness: true
  # Validates :clue_image, presence: true, uniqueness: true
  # Validates :clue_sentence, presence: true, uniqueness: true
end
