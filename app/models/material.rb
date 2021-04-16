class Material < ApplicationRecord
  belongs_to :artwork

  validates :name, presence: true
  validates :category, presence: true
end
