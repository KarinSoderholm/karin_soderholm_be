class ArtistStatement < ApplicationRecord
  require 'csv'
  belongs_to :artwork

  validates :name, presence: true
  validates :statement, presence: true
end
