class Collection < ApplicationRecord
  has_many :artwork_collections
  has_many :artworks, through: :artwork_collections

  validates :name, presence: true

  def find_artworks
    binding.pry
  end
end
