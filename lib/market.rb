class Market 
  attr_reader :name, 
              :vendors

  def initialize(name) 
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = @vendors.map { |vendor| vendor.name} #proud i've
    #become more comfy with using curly brackets! 
  end

  def vendors_that_sell(items)
    @vendors.select { |vendor| vendor.inventory.include?(items)}
  end

  def total_inventory
   total_inventory = Hash.new(0)
    @vendors.each do |vendor| #returns vendors and their items
      # require 'pry'; binding.pry
      vendor.inventory.each do |item, amount| #goes over their items and amounts
        if total_inventory.keys.include?(item) #confirms their keys hold the details of item
          total_inventory[item][:quantity] += amount
        else #THIS TOOK ME SO LONG I AM SO PROUD
          total_inventory[item] = {quantity: amount, vendors: vendors_that_sell(item)}
        end
      end#originally had total_inventory returning on line 33, was throwing an error.  
    end 
    total_inventory #i hate hashes. 
  end

  def overstocked_items#sold by more than 1 vendor AND the total quantity is greater than 50.
  #  total_inventory...... need to go through it and return count and who 
  #it is sold by.
  total_inventory.select do |item, quantity|
     #item, details?
    #quantity[:quantity...???]
  end
end