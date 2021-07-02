class Classroom < ApplicationRecord
  require 'csv'

  has_many :tools, dependent: :destroy
  has_many :requirements, dependent: :destroy
  has_many :order_classrooms, dependent: :destroy
  has_many :orders, through: :order_classrooms, dependent: :destroy
  has_many_attached :photos
  # has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: false
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :active, inclusion: [true, false]
  validates :cost, presence: true
  validate :acceptable_image

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      params = {}
      row.to_hash.map do |k, v|
        if k == "active" && v == "TRUE"
          params[k.to_sym] = true
        elsif k == 'active' && v == "FALSE"
          params[k.to_sym] = false
        elsif k == "cost "
          params[:cost] = v.to_f
        else
          params[k.to_sym] = v.to_s
        end
      end
      return params
      # requirement
      # tool
    end
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

  def find_all_tools
    self.tools.map { |tool| tool.name }
  end

  def find_all_requirements
    self.requirements.map { |requirement| requirement.name}
  end

  def find_reference_classroom_id(requirement_classroom_name)
    Classroom.find_by(name: requirement_classroom_name)
  end

  def get_active_status
    if self.active == true
      return 'active'
    elsif self.active == false
      return 'inactive'
    end
  end

  def set_images(params)
    if params[:classroom][:photos]
      self.photos.attach(params[:classroom][:photos])
    end
  end

  def acceptable_photos
    return unless photos.attached?

    photos.map do |photo|
      unless photo.byte_size <= 1.megabyte
        errors.add(:photos, "is too big")
      end
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:photos, "must be a JPEG or PNG")
    end
  end

  def set_availability(params)
    if params[:classroom][:date] < Time.now.to_datetime
      params[:classroom][:active] = false
      self.active = false
      return params
    else
      params[:classroom][:active] = true
      self.active = true
      return params
    end
  end
end
