class Zombie
  @@horde = []

  @@plague_level = 10

  @@max_speed = 5

  @@max_strength = 8

  @@default_speed = 1

  @@default_strength = 3

  attr_accessor :speed :strength

  def initialize(speed, strength)
    @speed = speed
    @strength = strength
    if @speed > @@max_speed
      @speed = @@default_speed
    end
    if @strength >= @@max_strength
      @strength = @@default_strength
    end
  end

  def encounter
  end

  def outrun_zombie?
  end

  def surviv_attack?
  end

  def self.all
  end

  def self.new_day
  end

  def self.some_die_off
  end

  def self.spawn
  end

  def self.increase_plague_level
  end
end
