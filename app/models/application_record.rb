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

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 1.megabyte
      errors.add(:image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG")
    end
  end

  # def translate_date
  #   self.strftime("%b %Y")
  # end
end
