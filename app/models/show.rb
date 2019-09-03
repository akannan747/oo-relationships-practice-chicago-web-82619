class Show
  @@all = []
  attr_reader :name

  # Initialize a Show with its name.
  def initialize(name)
    @name = name
    @@all << self
  end

  # Create a Role with self and Character.
  def assign_role(character)
    Role.new(self, character)
  end

  # Return all the Characters in this Show.
  def get_characters
    Role.all.select {|role| role.media == self}
  end

  # Return all the Actors that acted in this Show.
  def get_cast
    get_characters.map {|char| char.actor}
  end

  # Return all Movies that share a name with this Show.
  def on_the_big_screen
    Movies.all.select {|movie| movie.name == self.name}
  end

  # Return all Shows.
  def self.all
    @@all
  end
end
