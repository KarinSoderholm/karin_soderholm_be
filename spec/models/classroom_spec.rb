require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :location }
    it { should validate_presence_of :requirements }
    it { should validate_presence_of :tools_needed }
    it { should validate_presence_of :active }
    it { should validate_presence_of :cost }
  end
end
