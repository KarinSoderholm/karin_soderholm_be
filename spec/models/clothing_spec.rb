require 'rails_helper'

RSpec.describe Clothing, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    # it { should validate_presence_of :fabric }
    it { should validate_presence_of :url }
    it { should validate_presence_of :category }
    it { should validate_presence_of :available }
    # it { should validate_presence_of :pattern_name }
    it { should validate_presence_of :origin_date }
    # it { should validate_presence_of :pattern_cost }
    it { should validate_presence_of :cost }
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
