require 'pry'
class Owner
  @@all = []

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish_name)
    pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
    pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    pets.map do |type, pets|
      pets.map do |animal| animal.mood = "nervous"
      end
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

end
