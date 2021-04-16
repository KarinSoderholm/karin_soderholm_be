class Classroom < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :active, presence: true
  validates :cost, presence: true
end
