class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def full_address
    "#{self.address}, #{self.city}, #{self.state}, #{self.zip}"
  end

  def subtotal(item_hash)
    item_hash.quantity * item_hash.price
  end

  def fulfill
    update(fulfilled: true)
    item.update(inventory: item.inventory - quantity)
  end

  def fulfillable?
    item.inventory >= quantity
  end
end
