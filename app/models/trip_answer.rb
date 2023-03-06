class TripAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :trip
end
