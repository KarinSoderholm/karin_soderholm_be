class Artwork < ApplicationRecord
  require 'csv'

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

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Artwork.create! row.to_hash
      # artist_statement
      # art_show
      # material
    end
  end

  def availability?
    if self.available
      "available! Click the picture for more details!"
    else
      "unavailable. Someone beat you to the punch! Check out all the other options available."
    end
  end
end
