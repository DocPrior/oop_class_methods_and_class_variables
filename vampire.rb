class Vampires
  @@coven = []

  attr_accessor :in_coffin, :drank_blood_today
  attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.create(name, age)
    new_vampire = Vampires.new(name, age)
    @@coven << new_vampire
    new_vampire
  end

  def self.sunrise
    @@coven.each do |vampire|
      if vampire.in_coffin == false || vampire.drank_blood_today == false
        @@coven.delete(vampire)
      end
    end
    @@coven
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.in_coffin = false
      vampire.drank_blood_today =false
    end
    @@coven
  end

  def self.all
    @@coven
  end
end
#
vamp1 = Vampires.create("Mac", 100)

vamp2 = Vampires.create("Bob", 100)
"====================="
puts Vampires.all.inspect

Vampires.sunset

puts Vampires.all.inspect
# vamp2.drink_blood
#
# Vampires.sunrise
# "=================="
# puts Vampires.all.inspect
