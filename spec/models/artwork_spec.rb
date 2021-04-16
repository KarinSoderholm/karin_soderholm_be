require 'rails_helper'

RSpec.describe Artwork, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :create_date }
    it { should validate_presence_of :sell_date }
    it { should validate_presence_of :cost }
    it { should validate_presence_of :available }
  end
end
