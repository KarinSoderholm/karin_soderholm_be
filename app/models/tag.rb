class Tag < ApplicationRecord
  has_many :tag_posts, dependent: :destroy
  has_many :blog_posts, through: :tag_posts, dependent: :destroy

  def self.find_names
    Tag.pluck(:title)
  end
end
