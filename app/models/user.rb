class User < ApplicationRecord
  has_secure_password

  has_many :orders
  has_one :social

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip,
                        :email

  validates_uniqueness_of :email

  enum role: ['default', 'admin']
end
