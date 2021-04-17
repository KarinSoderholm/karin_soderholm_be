require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :location }
    it { should validate_inclusion_of(:active).in_array([true, false]) }
    it { should validate_presence_of :cost }
  end

  describe 'relationships' do
    it { should have_many :tools }
    it { should have_many :requirements }
  end
end
