class OrderClothing < ApplicationRecord
  belongs_to :clothing
  belongs_to :order

  def find_clothing
    Clothing.find(clothing_id)
  end

  def self.sub_total(order)
    if order.order_clothings
      order.order_clothings.sum do |order_clothing|
        order_clothing.price * order_clothing.quantity
      end
    else
      0
    end 
  end
end
