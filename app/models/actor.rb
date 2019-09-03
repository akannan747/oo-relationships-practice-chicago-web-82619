class Actor
  @@all = []
  attr_reader :name

  # Initialize an Actor with their name.
  def initialize(name)
    @name = name
    @@all << self
  end

  # Create a new character that an Actor will portray.
  def play_character(char_name)
    Character.new(char_name, self)
  end

  # Return all characters an Actor plays.
  def character_credits
    Character.all.select {|char| char.actor == self}
  end

  # Return the number of characters an Actor has played.
  def num_roles_played
    character_credits.size
  end

  # Return all media an Actor appears in.
  def credits
    character_credits.reduce([]) do |memo, character|
      memo.push(character.get_roles)
    end.flatten
  end

  # Return all Actors.
  def self.all
    @@all
  end

  # Returns the Actor who has played the most Characters.
  def self.most_characters
    all.reduce do |memo, actor|
      actor.num_roles_played > memo.num_roles_played ? actor : memo
    end
  end
end