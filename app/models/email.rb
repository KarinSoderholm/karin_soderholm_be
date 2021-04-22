class Email < ApplicationRecord
  validates :email_address, :presence => true,
                :length => {:minimum => 3, :maximum => 254},
                :uniqueness => true
                # :email => true
  validates :name, :presence => true
end
