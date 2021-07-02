class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def full_address
    "#{self.address}, #{self.city}, #{self.state}, #{self.zip}"
  end

  def subtotal(item_hash)
    item_hash.quantity * item_hash.price
  end

  def fulfill
    binding.pry
    update(fulfilled: true)
    item.update(inventory: item.inventory - quantity)
  end

  def fulfillable?
    binding.pry
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

  def find_item_type
    if self.class == Artwork
      return 'artwork'
    elsif self.class == Classroom
      return 'classroom'
    elsif self.class == Clothing
      return 'clothing'
    end
  end

  def set_availability_based_on_inventory
    if self.inventory == 0
      self.update(available: false)
    else self.inventory > 0
      self.update(available: true)
    end
  end
end
