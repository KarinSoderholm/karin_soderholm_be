class Cart
  attr_reader :contents, :saved_discounts, :subtotal_discount

  def initialize(contents)
    @contents = contents || {}
    @contents.default = 0
  end

  def find_item(item_hash)
    if item_hash.keys.include?(:classroom)
     item = Classroom.find(item_hash[:classroom])
    elsif item_hash.keys.include?(:artwork)
     item = Artwork.find(item_hash[:artwork])
    elsif item_hash.keys.include?(:clothing)
      item = Clothing.find(item_hash[:clothing])
    else
     flash[:error] = 'That item is not in our sytem. Please try again'
    end
  end

  def add_item(item)
    # i want this 'item' to be a hash to tack the type of item i'm keeping
    @contents[item] += 1
  end

  def less_item(item)
    @contents[item] -= 1
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

  def count_of(item)
    @contents[item.to_s]
  end

  def subtotal_of(item_hash)
    @contents[item_hash] * find_item(item_hash).cost
  end

  def limit_reached?(item)
    false
    # count_of(item_id) == find_item(item_id).inventory
  end
end
