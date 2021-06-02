require 'rails_helper'

RSpec.describe Clothing, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    # it { should validate_presence_of :image }
    # it { should validate_presence_of(:url).allow_nil }
    it { should validate_presence_of :category }
    it { should validate_inclusion_of(:available).in_array([true, false]) }
    it { should validate_presence_of :origin_date }
    it { should validate_presence_of :cost }
  end

  describe 'relationships' do
    it { should have_many :fabrics }
    it { should have_many :patterns }
  end

  describe 'instance methods' do
    before :each do
      @jacket = Clothing.create!(name: 'Woven Jacket',
                                description: 'Warm, quilted jacket',
                                category: 'Outerwear',
                                available: true,
                                origin_date: '2021-05-18',
                                cost: 155.00)
    end

    it '.availability?' do
      expect(@jacket.availability?).to eq('available!')
      expect(@jacket.availability?).to_not eq('unavailable.')
    end
  end

  describe 'class methods' do
    before :each do
      @jacket = Clothing.create!(name: 'Woven Jacket',
                                description: 'Warm, quilted jacket',
                                category: 'Outerwear',
                                available: true,
                                origin_date: '2021-05-18',
                                cost: 155.00)
      @shirt = Clothing.create!(name: 'Blue Shirt',
                                description: 'Boxy, square-fit, linen shirt',
                                category: 'Outerwear',
                                available: true,
                                origin_date: '2021-05-18',
                                cost: 155.00)
    end

    it '#total_sold' do

    end

    it '#total_available' do

    end
  end
end
