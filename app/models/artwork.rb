class Artwork < ApplicationRecord
  include ActiveModel::Dirty
  define_attribute_methods
  require 'csv'

  has_many :artshow_artworks, dependent: :destroy
  has_many :artshows, through: :artshow_artworks
  has_many :materials, dependent: :destroy
  has_one :artwork_statement, dependent: :destroy
  has_many :order_artworks, dependent: :destroy
  has_many :orders, through: :order_artworks, dependent: :destroy
  has_many :artwork_collections, dependent: :destroy
  has_many :collections, through: :artwork_collections, dependent: :destroy

  has_many_attached :photos
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :create_date, presence: true
  validates :sell_date, presence: false
  validates :cost, presence: true
  validates :available, inclusion: [true, false]
  validates :inventory, presence: true
  validate :acceptable_image


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

  def available?
    if self.available
      return true
    else
      return false
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

  def set_availability(params)

    if !params[:artwork][:sell_date].empty?
      params[:artwork][:available] = false
      self.available = false
      return params
    else
      params[:artwork][:available] = true
      self.available = true
      return params
    end
  end

  def set_sell_date
    binding.pry
    self.update(sell_date: Time.now.utc.iso8601)
  end

  def set_images(params)
    if params[:photos]
      self.photos.attach(params[:photos])
    elsif params[:artwork][:photos]
      self.photos.attach(params[:artwork][:photos])
    end
  end

  def acceptable_photos
    return unless photos.attached?

    photos.map do |photo|
      unless photo.byte_size <= 1.megabyte
        errors.add(:photos, "is too big")
      end
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(photo.content_type)
      errors.add(:photos, "must be a JPEG or PNG")
    end
  end

  def translate_date
    (self.create_date).strftime("%b %Y")
  end
end
