class ArtistStory < ApplicationRecord
  belongs_to :user

  validates :story, presence: true
end
