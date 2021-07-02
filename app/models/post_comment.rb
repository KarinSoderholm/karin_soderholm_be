class PostComment < ApplicationRecord
  validates :comment, presence: :true
  validates :guest_name, presence: :true
  validates :guest_email, presence: :true

  belongs_to :blog_post
end
