class Clothing < ApplicationRecord
  require 'csv'

  has_many :fabrics, dependent: :destroy
  has_many :patterns, dependent: :destroy
  has_many :order_clothings, dependent: :destroy
  has_many :orders, through: :order_clothings, dependent: :destroy
  has_many :object_collections, dependent: :destroy
  has_many :collections, through: :object_collections, dependent: :destroy
  has_one_attached :image
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: false
  validates :category, presence: true
  validates :available, inclusion: [true, false]
  validates :origin_date, presence: true
  validates :cost, presence: true
  validate :acceptable_image

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Clothing.create! row.to_hash
      # fabric
      # pattern
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

  def find_object_collection(physical_object)
    physical_object.collections.first.collection_type
  end
end
