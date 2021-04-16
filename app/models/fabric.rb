class Fabric < ApplicationRecord
  belongs_to :clothing

  validates :name, presence: true
  validates :category, presence: true
end
