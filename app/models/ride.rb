class Ride
  @@all = []
  attr_reader :driver, :passenger, :distance

  def initialize(driver, passenger, distance)
    @driver = driver
    @passenger = passenger
    @distance = distance
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    all.map {|ride| ride.distance}.sum / all.length
  end
end
