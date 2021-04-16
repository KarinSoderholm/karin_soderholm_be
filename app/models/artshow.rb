class Artshow < ApplicationRecord
  has_many :artshow_artworks
  has_many :artworks, through: :artshow_artworks

  validates :name, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :entry_fee, presence: false
end
