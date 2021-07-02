class Cart
  attr_reader :contents, :saved_discounts, :subtotal_discount

  def initialize(contents)
    @contents = contents || {}
    @contents.default = 0
  end

  def find_item(item_hash)
    if item_hash.keys.include?(:classroom)
      find_clasroom(item_hash)
    elsif item_hash.keys.include?(:artwork)
      find_artwork(item_hash)
    elsif item_hash.keys.include?(:clothing)
      find_object(item_hash)
    end
  end

  def find_classroom(item_hash)
    Classroom.find(item_hash[:classroom])
  end

  def find_artwork(item_hash)
    Artwork.find(item_hash[:artwork])
  end

  def find_object(item_hash)
    Clothing.find(item_hash[:clothing])
  end

  def add_item(item)
    # i want this 'item' to be a hash to tack the type of item i'm keeping
    # example: item = {{:clothing=>1}=>2}. Which means that Clothing.id ==1 has 2 instances of that in the Cart
    @contents[item] += 1
  end

  def less_item(item_type, item_id)
    @contents[{item_type.to_sym => item_id.to_i}] -= 1
  end

  def count
    @contents.values.sum
  end

  def items
    @contents.keys.map do |item|
      item
    end
  end

  def grand_total
    grand_total = 0.0
    @contents.each do |item_hash, quantity|
      item = find_item(item_hash)
      grand_total += (item.cost) * quantity
    end
    grand_total
  end

  def count_of(item_hash)
    @contents[item_hash]
  end

  def subtotal_of(item_hash)
    @contents[item_hash] * find_item(item_hash).cost
  end

  def limit_reached?(item_id, item_type)
    hash = {}
    hash[item_type.to_sym] = item_id.to_i
    count_of(hash) >= find_item(hash).inventory
  end
end
