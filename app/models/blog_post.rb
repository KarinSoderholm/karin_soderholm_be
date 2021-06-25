class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true

  has_many_attached :photos

  has_many :tag_posts
  has_many :tags, through: :tag_posts
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
end
