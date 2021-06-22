class ArtistStatement < ApplicationRecord
  belongs_to :user, optional: true

  validates :statement, presence: true
end
