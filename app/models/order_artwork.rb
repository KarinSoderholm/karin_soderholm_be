class OrderArtwork < ApplicationRecord
  belongs_to :artwork
  belongs_to :order

  def find_artwork
    Artwork.find(artwork_id)
  end

  def self.sub_total(order)
    if order.order_artworks  
      order.order_artworks.sum do |order_artwork|
        order_artwork.price * order_artwork.quantity
      end
    else
      0
    end
  end
end
