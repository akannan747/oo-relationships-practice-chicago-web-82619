class Character
  @@all = []
  attr_reader :name, :actor

  # Initialize a Character with their name.
  def initialize(name, actor)
    @name = name
    @actor = actor
    @@all << self
  end

  # Create a Role with media and self.
  def assign_media(media)
    Role.new(media, self)
  end

  # Return all the roles a character has played.
  def get_roles
    Role.all.select {|role| role.character == self}
  end

  # Return the number of roles a character has played.
  def get_num_roles
    get_roles.size
  end

  # Return all Characters.
  def self.all
    @@all
  end

  # Return the Character with the most appearances.
  def self.most_appearances
    all.reduce do |memo, char|
      char.get_num_roles > memo.get_num_roles ? char : memo
    end
  end
end