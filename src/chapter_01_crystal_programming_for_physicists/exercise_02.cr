require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 2 : ANOTHER BALL DROPPED FROM A TOWER ========================================
# 
# A ball is again dropped from a tower of height h with initial velocity zero.
# 
# Write a Crystal function that prints on the screen the time it takes for the ball to
# hit the ground.
# The function should receive the height of the tower as argument.
# =======================================================================================

def time_to_hit_the_ground(from_height h : Float64)
    g = PhysicalConstants::GRAVITY_STANDARD_ACCELERATION
    t = Math.sqrt(2 * h / g)
    puts "A ball dropped from #{h} metres takes #{t.round(2)} seconds to hit the ground."
end


puts "\n"
puts "EXERCISE 2 : ANOTHER BALL DROPPED FROM A TOWER\n"
puts "\n"

time_to_hit_the_ground from_height: 50
time_to_hit_the_ground from_height: 100
time_to_hit_the_ground from_height: 200

puts "\n"
