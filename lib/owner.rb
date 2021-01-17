require 'pry'
class Owner
  
  @@all =[]

  attr_reader :name, :species 

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    p "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat|cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog|dog.owner == self}
  end

  def buy_cat(kitten)
    Cat.new(kitten, self)
  end

  def buy_dog(puppy)
    Dog.new(puppy, self)
  end

  def walk_dogs
    dogs.each{|dog| dog.mood = 'happy'}
  end

  def feed_cats
    cats.each{|cat| cat.mood = 'happy'}
  end

  def sell_pets
    dogs.each{|dog| dog.owner, dog.mood = nil, 'nervous'}
    cats.each{|cat| cat.owner, cat.mood = nil, 'nervous'}
  end

  def list_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end