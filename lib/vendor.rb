class Vendor 
  attr_reader :name, 
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

  def potential_revenue 
    @inventory.sum {|item, quantity| item.price * quantity}
    # @inventory.map {|item, quantity| item.price * quantity}.sum
    #summing the returned array from the map method. 
  end
end