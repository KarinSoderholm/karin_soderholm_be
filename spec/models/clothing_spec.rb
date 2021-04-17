require 'rails_helper'

RSpec.describe Clothing, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
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
end
