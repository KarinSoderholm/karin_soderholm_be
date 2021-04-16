class Clothing < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  # validates :fabric, presence: true
  validates :url, presence: true
  validates :category, presence: true
  validates :available, presence: true
  # validates :pattern_name, presence: true
  validates :origin_date, presence: true
  # validates :pattern_cost, presence: true
  validates :cost, presence: true
end
