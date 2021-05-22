class Requirement < ApplicationRecord
  belongs_to :classroom

  validates :name, presence: true

end
