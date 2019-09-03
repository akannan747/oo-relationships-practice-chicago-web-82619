class Role
  @@all = []
  attr_reader :media, :character

  # Initialize a Role with a media and a Character.
  def initialize(media, character)
    @media = media
    @character = character
    @@all << self
  end

  # Return all Roles.
  def self.all
    @@all
  end
end