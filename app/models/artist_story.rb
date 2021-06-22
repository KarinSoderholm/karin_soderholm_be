class ArtistStory < ApplicationRecord
  belongs_to :user
  
  validates :statement, presence: true
end
