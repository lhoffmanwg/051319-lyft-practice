class Driver

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
      ride.driver == self
    end
  end

	def passengers
    rides.collect do |ride|
      ride.passenger
    end
		# Return an array of all of the
		# Passengers this driver has driven
  end

	def self.find_by_name(name)
    @@all.find do |driver|
      driver.name == name
    end
		# Return an instance of Driver
		# whose name matches the argument
  end

  def self.mileage_cap(cap)
    hash = {}
    ary = []
    Ride.all.collect do |ride|
      if hash[ride.driver] == nil
         hash[ride.driver] = ride.distance
      else
        hash[ride.driver] = hash[ride.driver] + ride.distance
      end
    end
    ary = []
    hash.select do |k,v|
        if v > cap
          ary << k
        end
    end
    ary
  end

  def most_frequent_passenger
    most_drives = nil
    greatest_num = 0
    hash = {}
    passengers.each do |ride|
      if hash[ride] == nil
        hash[ride] = 1
      else
        hash[ride] = hash[ride] + 1
      end
    end
    hash.each do |k,v|
      if v > greatest_num
        greatest_num = v
        most_drives = k
      end
    end
    most_drives
  end

  def longest_ride
    longest_distance = 0
    longest_ride = nil
    rides.each do |ride|
      if ride.distance > longest_distance
        longest_distance = ride.distance
        longest_ride = ride
      end
    end
    longest_ride
  end

end
