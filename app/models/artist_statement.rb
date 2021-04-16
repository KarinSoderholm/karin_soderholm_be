class ArtistStatement < ApplicationRecord
  belongs_to :artwork

  validates :name, presence: true
  validates :statement, presence: true
end
