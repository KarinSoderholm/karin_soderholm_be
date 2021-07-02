class User < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one :social
  has_one :cv
  has_one :artist_statement
  has_one :artist_story

  has_one_attached :avatar

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip,
                        :email,
                        :time_zone

  validates_uniqueness_of :email
  # validates :email, email: true


  enum role: ['default', 'admin']

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
