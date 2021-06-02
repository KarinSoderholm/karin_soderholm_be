require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    # it { should validate_presence_of :image }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :location }
    it { should validate_inclusion_of(:active).in_array([true, false]) }
    it { should validate_presence_of :cost }
  end

  describe 'relationships' do
    it { should have_many :tools }
    it { should have_many :requirements }
    it { should have_many :order_classrooms }
    it { should have_many(:orders).through :order_classrooms}
  end

  describe 'instance methods' do
    before :each do
      @sewing101 = Classroom.create!(name: 'Sewing 101',
                                    description: 'Basics',
                                    # image: '/app/assets/images/beautiful-thread.png',
                                    date: '2021-05-18',
                                    time: '11:00',
                                    location: 'Teller Studio #5',
                                    active: true,
                                    cost: 65.00)
      @fabric_basics = Classroom.create!(name: 'Fabric Basics',
                                        description: 'Intro to fabrics',
                                        date: '2021-05-18',
                                        time: '10:00',
                                        location: 'Teller Studio #5',
                                        active: true,
                                        cost: 45.00)

      @sewing_machine = @sewing101.tools.create!(name: 'Sewing Machine')
      @stripped_fabric = @sewing101.tools.create!(name: 'Stripped Fabric')
      @yellow_thread = @sewing101.tools.create!(name: 'Yellow Thread')

      @fabric_basics_requirement = @sewing101.requirements.create!(name: 'Fabric Basics')
    end

    it '.active_status' do
      expect(@sewing101.active_status).to eq('Active')
      expect(@sewing101.active_status).to_not eq('Inactive')
    end

    it '.find_all_tools' do
      expect(@sewing101.find_all_tools).to eq(['Sewing Machine', 'Stripped Fabric', 'Yellow Thread'])
      expect(@sewing101.find_all_tools.count).to eq 3
      expect(@sewing101.find_all_tools).to_not eq(['Stripped Fabric', 'Sewing Machine', 'Yellow Thread'])
      expect(@sewing101.find_all_tools).to_not eq(['Sewing Machine', 'Yellow Thread'])
    end

    it '.find_all_requirements' do
      expect(@sewing101.find_all_requirements).to eq(['Fabric Basics'])
      expect(@sewing101.find_all_requirements).to_not eq(['Fabric Basics', 'Sewing 201'])
      expect(@sewing101.find_all_requirements.count).to eq(1)
      expect(@sewing101.find_all_requirements.count).to_not eq(0)
    end

    it '.find_reference_classroom_id(@fabric_basics)' do
      expect(@sewing101.find_reference_classroom_id(@fabric_basics_requirement.name)).to eq(@fabric_basics)
    end

  end

  describe 'class methods' do
    it '.active_classrooms' do
      expect(Classroom.active_classrooms).to eq 2
      expect(Classroom.active_classrooms).to_not eq 1
      expect(Classroom.active_classrooms).to_not eq 3
      expect(Classroom.active_classrooms).to_not eq 0
    end

    it '.inactive_classrooms' do
      expect(Classroom.inactive_classrooms).to eq 0
      expect(Classroom.inactive_classrooms).to_not eq 2
      expect(Classroom.inactive_classrooms).to_not eq 1
    end
  end
end
