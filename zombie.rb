class Zombie

@@horde = []
@@plague_level = 10
@@max_speed = 5
@@max_strength = 8
@default_speed = 1
@default_strength = 3
@zombie_speed = 0
@zombie_strength = 0

def initialize(zom_speed, zom_strength)
  @zombie_speed = (zom_speed > @@max_speed ? @@default_speed : zom_speed)
  @zombie_strength = (zom_strength > @@max_strength ? @@default_strength : zom_strength)
end

def self.all
  @@horde
end

def self.spawn
  num = rand(@@plague_level + 1)
  num.times {@@horde << Zombie.new(rand(@@max_speed), rand(@@max_strength))
  }
end

def self.new_day
  some_die_off
  spawn
  increase_plague_level
end

def self.increase_plague_level
  @@plague_level += rand(3)
end

def self.some_die_off
  @@horde.delete_at(rand(11))
end

def out_run_zombie?
  rand(@@max_speed + 1) > @zombie_speed
end

def survive_attack?
  rand(@@max_strength + 1) > @zombie_strength
end

def encounter
  if out_run_zombie?
    return "Safe and Sound"
  elsif survive_attack?
    return "You is dead"
  end
end

end

puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
