class ArtworkCollection < ApplicationRecord
  belongs_to :artwork, dependent: :destroy
  belongs_to :collection, dependent: :destroy
end
