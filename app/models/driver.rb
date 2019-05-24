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
		# Return an array of all of the
		# Passengers this driver has driven
  end

	def self.find_by_name(name)
		# Return an instance of Driver
		# whose name matches the argument
  end
end