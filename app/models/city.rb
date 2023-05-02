class City < ApplicationRecord
  has_many :itineraries
  validates :name, presence: true, uniqueness: true
  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis, against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }
end
