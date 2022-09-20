class Market
attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    items = []
    vendors.each do |vendor|
      vendor.inventory.each do |item|
        items << item[0].name if !items.include?(item[0].name)
      end
    end
    items.sort
  end

  def overstocked_items
    sum = Hash.new(0)
    @vendors.each { |vendor| vendor.inventory.each { |item, qty| sum[item] += qty}}
    overstocked = []
      sum.each {|item, qty| overstocked << item if vendors_that_sell(item).count > 1 && qty > 50}
    overstocked
  end 
    
  def total_inventory
    
  end
end