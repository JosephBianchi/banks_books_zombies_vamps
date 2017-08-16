class Vampire

@@coven = []
def initialize(name, age)
  @name = name
  @age = age
  @in_coffin = false
  @drank_blood_today = false


end

def self.create(name, age)
  vamp = Vampire.new(name,age)
  @@coven << vamp
  return vamp
end

def drink_blood
  @drank_blood_today = true
end

def sunrise
  if @in_coffin == false || @drank_blood_today == false
    @@coven.delete_at(self)
  end
end

def self.sunset
  @drank_blood_today = false
  @in_coffin = false
end

def go_home
  @in_coffin = true
end

def coven
  @@coven
end

def self.coven
  @@coven
end

end

joe = Vampire.create("joe", 25)
# p joe.coven

jack = Vampire.create("jack", 30)
# p joe.coven

p Vampire.coven

joe.drink_blood
p Vampire.coven
