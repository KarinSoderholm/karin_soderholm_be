class InstagramUser
  attr_reader :name, :photo, :width, :height
  def initialize(data)

    @name = data[:author_name]
    @photo = data[:thumbnail_url]
    @width = data[:thumbnail_width]
    @height = data[:thumbnail_height]
  end
end
