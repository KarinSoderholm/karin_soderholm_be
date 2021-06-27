class StudentWork < ApplicationRecord
  validates :title, presence: false
  validates :description, presence: false

  has_one_attached :image

  enum age_category: { young_adult: 'young_adult', adult: 'adult' }

  def self.total_student_works
    StudentWork.all.count
  end

  def self.total_young_adults
    where(age_category: 'young_adult').count
  end

  def self.total_adults
    where(age_category: 'adult').count
  end

  def remove_image(params)
    if self.image.attached?
      self.image.purge
    else
      return params
    end
  end

  def set_image(params)
    if params[:image]

      self.image.attach(params[:image])
    else
      return params
    end
  end
  def self.find_adults
    where(age_category: 'adult')
  end

  def self.find_youths
    where(age_category: 'young_adult')
  end
end
