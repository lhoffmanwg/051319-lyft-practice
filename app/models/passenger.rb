class Passenger

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end 

  def rides
    Ride.all.select do |ride|
      ride.passenger == self
    end
  end

  def drivers
		# Return an array of all of the
		# Drivers that this Passenger has had
  end

  def total_distance
		# Find the total distance that this
		# Passenger has taken rides
  end

  def self.find_all_by_pattern(pattern)
		# STRETCH GOAL -> This method is a bit different
		# than the others we have seen, and therefore is
		# a bonus. Find a Passenger by name using a partial
		# match. If you have a Passenger named 'Alex', you
		# should be able to find by searching 'Al', 'lex', etc.
  end

end
