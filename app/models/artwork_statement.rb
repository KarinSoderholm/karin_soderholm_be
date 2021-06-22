class ArtworkStatement < ApplicationRecord
  require 'csv'
  belongs_to :artwork

  validates :statement, presence: true

  def find_artwork
    Artwork.find(self.artwork_id)
  end
end
