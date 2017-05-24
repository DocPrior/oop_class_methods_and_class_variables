class Vampires
  @@coven = []

  attr_accessor :in_coffin, :drank_blood_today
  attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = true
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.create(name, age)
    new_vampire = Vampires.new(name, age)
    @@coven << new_vampire
    new_vampire
  end

end
