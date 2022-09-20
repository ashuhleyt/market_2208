require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do 
  before(:each) do 
    @market = Market.new("South Pearl Street Farmers Market")
  end

  it 'exists and has readable attributes' do 
    expect(@market).to be_instance_of(Market)
  end
end