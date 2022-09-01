require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do

  before :each do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
  end

  it 'exists' do 
    expect(@dealership).to be_instance_of(Dealership)
  end 

  it 'can add and count inventory' do
    expect(@dealership.inventory).to eq([])
    expect(@dealership.inventory_count).to eq 0
    
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    
    expect(@dealership.inventory).to eq([car_1, car_2])
    expect(@dealership.inventory_count).to eq 2
  end

  ### I3

  it 'can identify ' do
    expect(@dealership.has_inventory?).to eq false
    
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)

    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)

    expect(@dealership.has_inventory?).to eq true
    
    expect(@dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
    expect(@dealership.cars_by_make("Ford")).to eq([car_1])

    expect(@dealership.total_value).to eq(156000)
    expect(@dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
  end

  ### I4

  it 'can give pricing of cars' do 
    
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)

    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)


    # expect(@dealership.average_price_of_car).to eq("39,0000")
    expect(@dealership.cars_sorted_by_price).to eq([car_3, car_4, car_2, car_1])
  end
  
  xit 'can give inventory by make' do 
    
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)

    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)
    
    expect(@dealership.inventory_hash).to eq({"Ford"=> [car_1], "Toyota"=> [car_2, car_3],"Chevrolet"=> [car_4]})
  end

end