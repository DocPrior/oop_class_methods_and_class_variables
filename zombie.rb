class Zombie
  @@horde = []

  @@plague_level = 10

  @@max_speed = 5

  @@max_strength = 8

  @@default_speed = 1

  @@default_strength = 3

  attr_accessor :speed, :strength

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
    outrun_zombie?

    survive_attack?

    if outrun_zombie? == false && survive_attack? == true
      new_zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << new_zombie
      p "You became a zombie."
    end

    if outrun_zombie? == true && survive_attack? == true
      p "You escaped"
    end

    if survive_attack? == false
      p "You were killed"
    end
  end

  def outrun_zombie?
    speed = rand(@@max_speed)
    if speed > @speed
      true
    else
      false
    end
  end

  def survive_attack?
    strength = rand(@strength)
    if strength > @strength
      true
    else
      false
    end
  end

  def self.all
    @@horde
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn_
    Zombie.increase_plague_level
  end

  def self.some_die_off
    @@horde.drop(rand(@@plague_level))
  end

  def self.spawn_
    rand(@@plague_level).times do
      new_zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << new_zombie
    end
    @@horde
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end
end

Zombie.increase_plague_level

puts Zombie.all.inspect

Zombie.new_day
"=========================="
puts Zombie.all.inspect
"========================="
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]

"===================="
puts zombie1.encounter
puts zombie2.encounter
puts zombie3.encounter
"========================"
Zombie.new_day
"========================"
puts Zombie.all.inspect
"========================="
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
"========================="
puts zombie1.encounter
puts zombie2.encounter
puts zombie3.encounter
