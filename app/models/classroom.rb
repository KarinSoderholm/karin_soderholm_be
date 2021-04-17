class Classroom < ApplicationRecord
  has_many :tools, dependent: :destroy
  has_many :requirements, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :active, inclusion: [true, false]
  validates :cost, presence: true
end
