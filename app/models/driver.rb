class Driver
  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end
  
  def rides
    Ride.all.select {|ride| ride.driver == self}
  end
  
  def passengers
    rides.map {|ride| ride.passenger}.uniq
  end

  def total_mileage
    rides.reduce(0) {|memo, ride| memo += ride.distance}
  end

  def self.all
    @@all
  end

  def self.mileage_cap(distance)
    all.select {|driver| driver.total_mileage > distance}
  end
end
