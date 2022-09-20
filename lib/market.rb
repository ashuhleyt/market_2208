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
    #vendors.map(&:name)
  end

  def vendors_that_sell(items)
    @vendors.select { |vendor| vendor.inventory.include?(items)}
    #@vendors.reject do |vendor|
      # vendor.inventory.keys.include?(item) = false
    # end
  end

  def total_inventory
   total_inventory = Hash.new(0)
    @vendors.each do |vendor| 
      vendor.inventory.each do |item, amount| 
        if total_inventory.keys.include?(item) 
          total_inventory[item][:quantity] += amount
        else 
          total_inventory[item] = {quantity: amount, vendors: vendors_that_sell(item)}
        end
      end 
    end 
    total_inventory 
  end

  def overstocked_items
    #overstock = total_inventory select yada
    total_inventory.select do |item, details| 
      details[:quantity] > 50 && details[:vendors].length >= 2
    end.keys 
    #overstock.keys 
  end

  def sorted_item_list #what methods give me the item names, total inventory hash. 
    total_inventory.keys.map do |item|
      item.name
    end.sort
  end

  def date 
    # date = Date.new.to_s
    # "#{date[8..9]}/#{date[5..6]}/#{date[0..3]}"

    Date.today.strftime "%d/%m/%Y".to_s
  end
end