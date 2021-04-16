require 'rails_helper'

RSpec.describe ArtshowArtwork, type: :model do
  describe 'relationships' do
    it { should belong_to :artwork }
    it { should belong_to :artshow }
  end
end
