class Listing
  @@all = []
  attr_reader :city

  def initialize(city)
    @city = city
    @@all << self
  end

  def trips
    Trip.all.select {|trip| trip.listing == self}
  end

  def guests
    trips.map {|trip| trip.guest}.uniq
  end

  def trip_count
    trips.length
  end

  def self.all
    @@all
  end

  def self.find_all_by_city(city)
    all.select {|listing| listing.city == city}
  end

  def self.most_popular
    all.reduce {|memo, listing| listing.trip_count > memo.trip_count ? listing : memo}
  end
end
