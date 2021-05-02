class Artwork < ApplicationRecord
  require 'csv'

  has_many :artshow_artworks, dependent: :destroy
  has_many :artshows, through: :artshow_artworks
  has_many :materials, dependent: :destroy
  has_one :artist_statement, dependent: :destroy
  has_many :order_artworks, dependent: :destroy
  has_many :orders, through: :order_artworks, dependent: :destroy
  has_many :artwork_collections, dependent: :destroy
  has_many :collections, through: :artwork_collections, dependent: :destroy
  # has_many_attached :images
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: false
  validates :create_date, presence: true
  validates :sell_date, presence: false
  validates :cost, presence: true
  validates :available, inclusion: [true, false]
  validates :images, presence: false
  # validates :collection, presence: false

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
      "available!"
    else
      "unavailable."
    end
  end

  def self.total_sold
    where(available: false).count
  end

  def self.total_available
    where(available: true).count
  end

  def self.find_collections
    
  end

end
