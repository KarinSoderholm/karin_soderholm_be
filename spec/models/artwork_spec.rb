require 'rails_helper'

RSpec.describe Artwork, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :create_date }
    it { should validate_presence_of(:sell_date).allow_nil }
    it { should validate_presence_of :cost }
    it { should validate_inclusion_of(:available).in_array([true, false]) }
  end

  describe 'relationships' do
    it { should have_many :materials }
    it { should have_many :artshow_artworks }
    it { should have_many(:artshows).through :artshow_artworks }
    it { should have_one :artist_statement }
  end
end
