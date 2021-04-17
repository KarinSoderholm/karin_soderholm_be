class Artwork < ApplicationRecord
  has_many :artshow_artworks, dependent: :destroy
  has_many :artshows, through: :artshow_artworks
  has_many :materials, dependent: :destroy
  has_one :artist_statement, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :create_date, presence: true
  validates :sell_date, presence: false
  validates :cost, presence: true
  validates :available, inclusion: [true, false]
end
