require 'rails_helper'

RSpec.describe Artwork, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    # it { should validate_presence_of :image }
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
    it { should have_many :order_artworks }
    it { should have_many(:orders).through :order_artworks }
    it { should have_many :artwork_collections }
    it { should have_many(:collections).through :artwork_collections }
  end

  describe 'instance methods' do
    before :each do
      @niwot = Artwork.create!(name: 'Niwot',
                              description: 'A map of Niwot',
                              create_date: '2021-05-18',
                              cost: 125.00,
                              available: true)
    end

    it '.availability?' do
      expect(@niwot.availability?).to eq('available!')
      expect(@niwot.availability?).to_not eq('unavailable')
    end

  end

  describe 'class methods' do
    before :each do
      @niwot = Artwork.create!(name: 'Niwot',
                              description: 'A map of Niwot',
                              create_date: '2021-05-18',
                              cost: 125.00,
                              available: true)
      @cape_town = Artwork.create!(name: 'Cape Town',
                              description: 'A map of Cape Town',
                              create_date: '2021-05-18',
                              cost: 125.00,
                              available: false)
      @brussels = Artwork.create!(name: 'Brussels',
                              description: 'A map of Brussels',
                              create_date: '2021-05-18',
                              cost: 125.00,
                              available: false)
    end

    it '#total_sold' do
      expect(Artwork.total_sold).to eq 2
      expect(Artwork.total_sold).to_not eq 0
      expect(Artwork.total_sold).to_not eq 1
    end

    it '#total_available' do
      expect(Artwork.total_available).to eq 1
      expect(Artwork.total_available).to_not eq 0
      expect(Artwork.total_available).to_not eq 2
    end
  end
end
