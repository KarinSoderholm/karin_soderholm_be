class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true

  has_many_attached :photos

  has_many :tag_posts, dependent: :destroy
  has_many :tags, through: :tag_posts, dependent: :destroy
  belongs_to :user
  # has_many :responses

  def self.total_blog_posts
    BlogPost.all.count
  end

  def set_image(params)
    if params[:photos]
      self.photos.attach(params[:photos])
    elsif params[:post][:photos]
      self.photos.attach(params[:post][:photos])
    end
  end

  def self.find_by_month
    binding.pry
  end

  def self.find_blogs_by_tag(tag_id)
    # binding.pry
    BlogPost.joins(:tags).where(tags: {id: tag_id})
  end
end
