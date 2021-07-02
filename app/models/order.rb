class Order < ApplicationRecord
  has_many :order_artworks
  has_many :order_classrooms
  has_many :order_clothings

  has_many :order_artworks, dependent: :destroy
  has_many :artworks, through: :order_artworks, dependent: :destroy
  has_many :order_clothings, dependent: :destroy
  has_many :clothings, through: :order_clothings, dependent: :destroy
  has_many :order_classrooms, dependent: :destroy
  has_many :classrooms, through: :order_classrooms, dependent: :destroy

  belongs_to :user
  enum status: ['pending', 'packaged', 'shipped', 'cancelled']

  def grand_total
    classroom_subtotal = 0.0
    artwork_subtotal = 0.0
    clothing_subtotal = 0.0
    if !order_classrooms.empty?
      classroom_subtotal = order_subtotal(order_classrooms)
    end
    if !order_clothings.empty?
      clothing_subtotal = order_subtotal(order_clothings)
    end
    if !order_artworks.empty?
      artwork_subtotal = order_subtotal(order_artworks)
    end
    grand_total = classroom_subtotal + artwork_subtotal + clothing_subtotal
  end

  def order_subtotal(order_type)
    order_type.sum do |item_hash|
      subtotal(item_hash)
    end
  end

  def self.by_status
    order(:status)
  end

  def count_of_items
    order_clothings.sum(:quantity) + order_classrooms.sum(:quantity) + order_artworks.sum(:quantity)
  end

  def cancel
    update(status: 'cancelled')
    if !order_classrooms.empty?
      order_update(order_classrooms)
    end
    if !order_clothings.empty?
      order_update(order_clothings)
    end
    if !order_artworks.empty?
      order_update(order_artworks)
    end
  end

  def order_update(order_type)
    # binding.pry
    order_type.each do |item_hash|
      item_hash.update(fulfilled: false)
      if item_hash.class == OrderClothing
        clothing = Clothing.find(item_hash.clothing_id)
        inventory = clothing.inventory
        clothing.update(inventory: (inventory + item_hash.quantity))
        clothing.set_availability_based_on_inventory
      elsif item_hash.class == OrderArtwork
        artwork = Artwork.find(item_hash.artwork_id)
        inventory = artwork.inventory
        artwork.update(inventory: (inventory + item_hash.quantity))
        artwork.set_availability_based_on_inventory
        if !artwork.available?
          artwork.set_sell_date
        end
      end
      # binding.pry
    end
  end

  def is_packaged?
    update(status: 1) if order_items.distinct.pluck(:fulfilled) == [true]
  end

  def find_user
    User.find(self.user_id)
  end

  def date_fulfilled
    if self.status == 'fulfilled'
      return self.updated_at.strftime("%A, %d %b %Y")
    else
      return "-------"
    end
  end

  def subtotals
    # binding.pry
    self.order_artworks.sub_total(self) + self.order_classrooms.sub_total(self) + self.order_clothings.sub_total(self)

  #   classroom_price = self.order_classrooms.sum do |order_classroom|
  #     order_classroom.price
  #   end
  #
  #   clothing_price = self.order_clothings.sum do |order_clothing|
  #     order_clothing.price
  #   end
  #   clothing_price + classroom_price + artwork_price
  end
end
