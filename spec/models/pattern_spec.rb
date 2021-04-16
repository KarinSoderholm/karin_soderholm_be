require 'rails_helper'

RSpec.describe Pattern, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :designer }
  end

  describe 'relationships' do
    it { should belong_to :clothing }
  end

end
