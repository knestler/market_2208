require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before :each do
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'exists' do 
    expect(@vendor).to be_an_instance_of(Item)
  end

  it 'has attributes' do 
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
    expect(@vendor.inventory).to eq({})
  end

  it 'can stock items and check stock' do
    expect(@vendor.check_stock(@item1)).to eq(0)
    
    @vendor.stock(@item1, 30)
    expect(@vendor.inventory).to eq({@item1})
    expect(@vendor.check_stock(item1)).to eq(30)
    
    @vendor.stock(@item1, 25)
    expect(@vendor.check_stock(item1)).to eq(55)
    
    @vendor.stock(@item2, 12)
    expect(@vendor.inventory).to eq({@item1, @item2})
  end
end
