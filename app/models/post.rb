class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true

  has_many_attached :photos

  belongs_to :user
  # has_many :responses
end
