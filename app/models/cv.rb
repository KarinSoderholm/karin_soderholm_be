class Contact < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true

  has_one_attached :cv_file
end
