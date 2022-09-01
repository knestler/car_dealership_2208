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
end