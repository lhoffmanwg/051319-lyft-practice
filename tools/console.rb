require_relative '../config/environment'

# Drivers
d1 = Driver.new("Steve G")
d2 = Driver.new("David S")
d3 = Driver.new("Cody G")

# Passengers
p1 = Passenger.new("Ben H")
p2 = Passenger.new("Jason B")
p3 = Passenger.new("Jessica B")
p4 = Passenger.new("Jessica P")

# Rides
r1 = Ride.new(d1, p1, 4.2)
r2 = Ride.new(d1, p3, 3.4)
r3 = Ride.new(d2, p2, 2.5)
r4 = Ride.new(d2, p3, 5.6)
r5 = Ride.new(d3, p4, 1.3)
r6 = Ride.new(d3, p4, 9.3)
r7 = Ride.new(d1, p3, 3.3)
r8 = Ride.new(d1, p3, 3.7)
r9 = Ride.new(d3, p1, 6.2)

binding.pry
