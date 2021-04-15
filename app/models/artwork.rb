class Artwork < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :materials, presence: true
  validates :create_date, presence: true
  validates :sell_date, presence: true
  validates :cost, presence: true
  validates :art_shows, presence: true
  validates :available, presence: true
end
