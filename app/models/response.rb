class Response < ApplicationRecord
  validates :response, presence: :true
  validates :guest_name, presence: :true
  validates :guest_email, presnce: :true

  belongs_to :blog_post 
end
