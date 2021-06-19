class StudentWorks < ApplicationRecord
  validates :title, presence: false
  validates :description, presence: false

  has_one_attached :image
  
  enum age_category: { young_adult: 'young_adult', adult: 'adult' }
end
