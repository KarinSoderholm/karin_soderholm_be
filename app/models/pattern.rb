class Pattern < ApplicationRecord
  belongs_to :clothing

  validates :name, presence: true
  validates :designer, presence: true
end
