class Clothing < ApplicationRecord
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
end
