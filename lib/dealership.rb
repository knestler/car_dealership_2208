class Dealership

  attr_reader :name, :address, :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.count
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    @inventory.count != 0
  end

  def cars_by_make(make)
    @inventory.find_all do |car| 
      car.make == make
    end
  end

  def total_value
    value = []
    @inventory.each do |car|
      value << car.total_cost
    end
    value.sum
  end

  def details
    {"total_value" => total_value, "address" => @address}
  end

  # def average_price_of_car
  #   # require 'pry'; binding.pry
  #   (total_value / inventory.count).to_s.chars.insert(",")#.reverse.map_slice(3).map(&:join).join(',').reverse


  # end

  def cars_sorted_by_price
    @inventory.sort_by {|car| car.total_cost}
  end

  # def inventory_hash
  #   # require 'pry'; binding.pry
  #   hash = {}
  #     inventory.flat_map do |car| 
  #       [car.make, car]
  #     end
    
  # end

end