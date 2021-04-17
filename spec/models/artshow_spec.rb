require 'rails_helper'

RSpec.describe Artshow, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
    it { should validate_presence_of(:entry_fee).allow_nil }
  end

  describe 'relationships' do
    it { should have_many :artshow_artworks }
    it { should have_many(:artworks).through :artshow_artworks }
  end
end
