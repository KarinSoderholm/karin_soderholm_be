class Email < ApplicationRecord
  validates :email_address, :presence => true,
                :length => {:minimum => 3, :maximum => 254},
                :uniqueness => true
                # :email => true
  validates :name, :presence => true

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
end
