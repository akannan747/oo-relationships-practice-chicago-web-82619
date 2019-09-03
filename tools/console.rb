require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

## For airbnb
chi = Listing.new("Chicago")
la = Listing.new("Los Angeles")

mike = Guest.new("Mike")
joe = Guest.new("Joe")

trip1 = Trip.new(mike, chi)
trip2 = Trip.new(joe, chi)
trip3 = Trip.new(mike, la)

## For bakery

flatiron = Bakery.new("Flatiron Bakery")
yummy_time = Bakery.new("Yummy Time")

cake = Dessert.new("Chocolate Cake", flatiron)
cookies = Dessert.new("Cookies", yummy_time)
brownies = Dessert.new("Brownies", flatiron)

egg = Ingredient.new("Egg", 50, cake)
flour = Ingredient.new("Flour", 100, cake)
chocolate = Ingredient.new("Chocolate", 200, cake)

chips = Ingredient.new("Chips", 100, cookies)
peanuts = Ingredient.new("Peanuts", 50, cookies)

mix = Ingredient.new("Brownie mix", 200, brownies)
sugar = Ingredient.new("Sugar", 50, brownies)

## For lyft
mack = Passenger.new("mack")
cam = Driver.new("cam")
ride = Ride.new(cam, mack, 75)
# chips.bakery

# puts chips.name == "Chips"

binding.pry
0
