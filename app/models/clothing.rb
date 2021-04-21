class Clothing < ApplicationRecord
  require 'csv'

  has_many :fabrics, dependent: :destroy
  has_many :patterns, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :url, presence: false
  validates :category, presence: true
  validates :available, inclusion: [true, false]
  validates :origin_date, presence: true
  validates :cost, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Clothing.create! row.to_hash
      # fabric
      # pattern
    end
  end

  def availability?
    if self.available
      "available! Click the picture for more details!"
    else
      "unavailable. It was so popular, we don't have any more at this time. Check back soon for more inventory."
    end 
  end
end
