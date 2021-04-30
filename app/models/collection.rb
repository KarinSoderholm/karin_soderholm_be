class Collection < ApplicationRecord
  has_many :artwork_collections
  has_many :artworks, through: :artwork_collections

  validates :name, presence: true
end
