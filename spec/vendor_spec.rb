require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do 
  before(:each) do 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'exists and has readable attributes' do 
    expect(@vendor).to be_instance_of(Vendor)
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'starts with no inventory' do 
    expect(@vendor.inventory).to eq({})
  end

  it 'can check stock of items' do 
    expect(@vendor.check_stock(@item1)).to eq(0)
  end

  it 'can add items to vendor stock' do 
    @vendor.stock(@item1, 30)
    expect(@vendor.inventory).to eq({@item1 => 30})

    @vendor.stock(@item1, 25)
    expect(@vendor.inventory).to eq({@item1 => 55})

    @vendor.stock(@item2, 12)
    expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
  end

end
