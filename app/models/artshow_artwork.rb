class ArtshowArtwork < ApplicationRecord
  belongs_to :artshow
  belongs_to :artwork
end
