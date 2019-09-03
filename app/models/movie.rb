class Movie
  @@all = []
  attr_reader :name

  # Initialize a movie with its name.
  def initialize(name)
    @name = name
    @@all << self
  end

  # Create a role with self and Character.
  def assign_role(character)
    Role.new(self, character)
  end

  # Return all the Characters in this Movie.
  def get_characters
    Role.all.select {|role| role.media == self}
  end

  # Return all the Actors in this Movie.
  def get_cast
    get_characters.map {|char| char.actor}
  end

  # Return the size of the cast.
  def get_cast_size
    get_cast.size
  end

  # Return all Movies.
  def self.all
    @@all
  end

  # Return the Movie with the most Actors.
  def self.most_actors
    all.reduce do |memo, movie|
      movie.get_cast_size > memo.get_cast_size ? movie : memo
    end
  end
end