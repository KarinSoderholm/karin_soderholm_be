class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true

  has_many_attached :photos

  has_many :tag_posts, dependent: :destroy
  has_many :tags, through: :tag_posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :user

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
    self.select("date_trunc('day', created_at)")
      .group("date_trunc('day', created_at)")
      .pluck("date_trunc('day', created_at)")
  end

  def self.format_monthly_blog_date
    # send this to the BlogPostsController to have access to the month and year
    find_by_month.uniq.map do |month_group|
      [month_group.strftime("%B %Y"), month_group.strftime("%m"), month_group.strftime("%Y")]
    end
  end

  def self.format_monthly_blog
    # BlogPost.select('blog_posts.*').group("date_trunc('day', created_at)", :id).pluck('blog_posts.*')
    # self.find_by_month.uniq.map do |month_group|
      # month_group.strftime("%B %Y")
    # end
    blog_ids_by_date = {}
    BlogPost.select(:created_at).group(:created_at).pluck(:created_at).map do |date|
      blog_ids_by_date[(BlogPost.find_by(created_at: date)).id] = [date.strftime("%m"), date.strftime("%Y")]
    end
    return blog_ids_by_date
  end

  def self.find_blogs_by_tag(tag_id)
    BlogPost.joins(:tags).where(tags: {id: tag_id})
  end
end
