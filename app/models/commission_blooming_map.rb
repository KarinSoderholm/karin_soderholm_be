class CommissionBloomingMap < ApplicationRecord
  validates :customer_name, presence: true
  validates :customer_email, presence: true
  validates :customer_phone, presence: true
  validates :message, presence: true
  validates :map_city, presence: false
  validates :map_state, presence: false
  validates :map_country, presence: false
  validates :map_color, presence: false
end
