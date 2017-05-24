class Vampire
  @@coven = []

  attr_accessor :in_coffin, :drank_blood_today
  attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today= true
  end
end
