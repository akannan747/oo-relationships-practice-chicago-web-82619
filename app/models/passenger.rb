class Passenger
  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def rides
    Ride.all.select {|ride| ride.passenger == self}
  end

  def drivers
    rides.map {|ride| ride.driver}.uniq
  end

  def total_distance
    rides.reduce(0) {|memo, ride| memo += ride.distance}
  end

  def self.all
    @@all
  end

  def self.premium_member
    all.select {|passenger| passenger.total_distance > 100}
  end
end
