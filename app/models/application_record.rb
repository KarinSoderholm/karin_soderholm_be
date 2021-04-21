class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.format_date(date)
    binding.pry
  end

  def self.format_time(time)
    binding.pry
  end
end
