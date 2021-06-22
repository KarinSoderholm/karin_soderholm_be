class ArtistStatement < ApplicationRecord
  belongs_to :user

  validates :statement, presence: true
end
