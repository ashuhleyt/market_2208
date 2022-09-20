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
    names = @vendors.map { |vendor| vendor.name}
  end

  def vendors_that_sell(items)
    @vendors.select { |vendor| vendor.inventory.include?(items)}
  end
end