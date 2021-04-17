class Clothing < ApplicationRecord
  has_many :fabrics
  has_many :patterns
  
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :url, presence: true
  validates :category, presence: true
  validates :available, inclusion: [true, false]
  validates :origin_date, presence: true
  validates :cost, presence: true
end
