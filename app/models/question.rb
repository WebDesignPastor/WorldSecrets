class Question < ApplicationRecord
  belongs_to :itinerary
  has_many :trip_answers, dependent: :destroy
end
