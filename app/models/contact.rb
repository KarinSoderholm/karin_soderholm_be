class Contact < ApplicationRecord
  validates :name, presence: true
  validates :subject, presence: true
  validates :customer_email_address, presence: true
  validates :message, presence: true
end
