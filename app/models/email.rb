class Email < ApplicationRecord
  require 'csv'

  validates :email_address, :presence => true,
                :length => {:minimum => 3, :maximum => 254},
                :uniqueness => true
                # :email => true
  validates :name, :presence => true
  # validates :email_address, email: true

  def self.import(path)

  end

  def self.all_emails(current_user)
    if current_user
      emails = Email.all
      email_addresses = emails.map do |email|
        email.email_address
      end
      email_addresses.include?(current_user.email)
    else
      return false
    end
  end

  def self.find_all_emails
    Email.select(:email_address).pluck(:email_address)
  end
end
