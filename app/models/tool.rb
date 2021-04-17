class Tool < ApplicationRecord
  belongs_to :classroom

  validates :name, presence: true
end
