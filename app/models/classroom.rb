class Classroom < ApplicationRecord
  require 'csv'

  has_many :tools, dependent: :destroy
  has_many :requirements, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :active, inclusion: [true, false]
  validates :cost, presence: true

  def self.import(file)
    CSV.foreact(file.path, headers: true) do |row|
      Classroom.create! row.to_hash
      # requirement
      # tool
    end
  end

  def format_date(date)
    # binding.pry
  end

  def format_time(time)
    # binding.pry
  end

  def active_status
    if active?
      message = 'Active'
    else
      message = 'Inactive'
    end
  end

  def self.active_classrooms
    where(active: true).count
  end

  def self.inactive_classrooms
    where(active: false).count
  end
end
