class Cv < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  has_one_attached :cv_file

  def set_file(params)
    if params[:cv][:cv_file]
      self.cv_file.attach(params[:cv][:cv_file])
    end
  end

  def delete_file(params)
    binding.pry
    if self.cv_file.attached?
      self.cv_file.purge
    end
  end
end
