require 'rails_helper'

RSpec.describe ArtistStatement, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :statement }
  end

  describe 'relationships' do
    it { should belong_to :artwork }
  end
end
