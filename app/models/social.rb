class Social < ApplicationRecord
  belongs_to :user

  validates :linked_in, presence: false
  validates :facebook, presence: false
  validates :instagram, presence: false
  validates :pinterest, presence: false
  validates :twitter, presence: false
  validates :email, presence: false
  validates :etsy, presence: false
end
