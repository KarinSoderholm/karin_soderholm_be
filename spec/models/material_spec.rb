require 'rails_helper'

RSpec.describe Material, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :category }
  end

  describe 'relationships' do
    it { should belong_to :artwork }
  end
end
