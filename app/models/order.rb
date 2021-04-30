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

  def count_of_items
    order_items.sum(:quantity)
  end

  def self.by_status
    order(:status)
  end

  def count_of_items
    order_items.sum(:quantity)
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
    # flash[:success] = "The order was successfully cancelled"
  end

  def order_update(order_type)
    order_type.each do |item_hash|
      item_hash.update(fulfilled: false)
    end
  end

  def is_packaged?
    update(status: 1) if order_items.distinct.pluck(:fulfilled) == [true]
  end
end
