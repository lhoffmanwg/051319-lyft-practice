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
    rides.collect do |ride|
    #binding.pry
      ride.driver
    end
		# Return an array of all of the
		# Drivers that this Passenger has had
  end

  def total_distance
    rides.collect do |ride|
      ride.distance
    end.sum
		# Find the total distance that this
		# Passenger has taken rides
  end

  def self.find_all_by_pattern(pattern)
    @@all.select do |pass|
      pass.name.include?(pattern)
    end

		# STRETCH GOAL -> This method is a bit different
		# than the others we have seen, and therefore is
		# a bonus. Find a Passenger by name using a partial
		# match. If you have a Passenger named 'Alex', you
		# should be able to find by searching 'Al', 'lex', etc.
  end

  def self.premium_members
    hash = {}
    prem_mem = []
    Ride.all.each do |ride|
      if hash[ride.passenger] == nil
        hash[ride.passenger] = ride.distance
      else
        hash[ride.passenger] = hash[ride.passenger] + ride.distance
      end
    end
    hash.select do |k,v|
      if v > 15
        prem_mem << k
      end
    end
    prem_mem
  end

  def most_frequent_driver #driver with most trips with this passenger
    hash = {}
    most_rides = 0
    freq_driver = nil
    rides.select do |ride|
      if hash[ride.driver] == nil
        hash[ride.driver] = 1
      else
        hash[ride.driver] =  hash[ride.driver] + 1
      end
    end
    hash.each do |k,v|
      if v > most_rides
        most_rides = v
        freq_driver = k
      end
    end
    freq_driver
  end

end
