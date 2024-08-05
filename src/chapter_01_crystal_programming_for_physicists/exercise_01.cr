require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 1 : A BALL DROPPED FROM A TOWER ==============================================
# 
# A ball is dropped from a tower of height h. It has initial velocity zero and
# accelerates downwards under gravity.
# 
# Write a Crystal function that prints on the screen the height of the ball above the
# ground at time t after it is dropped, ignoring air resistance.
# The function should receive both the height of the tower and the time t as arguments.
# 
# The standard kinematic formula are given below:
# 
#       y = 0.5 * g * t^2
# 
# The standard acceleration of gravity in m.s-2 can be found in the Physical Constants
# library under PhysicalConstants::GRAVITY_STANDARD_ACCELERATION
# =======================================================================================

def height_of_a_ball_dropped(from_height h : Float64, at_t_equal t : Float64)
    g = PhysicalConstants::GRAVITY_STANDARD_ACCELERATION
    h0 = h
    h = h - 0.5 * g * t**2

    # A height of 0 means that the ball hit the ground, there can't be a negative height.
    h = 0 if h < 0

    puts "After #{t} seconds, a ball dropped from #{h0} metres is #{h.round(2)} metres high."
end


puts "\n"
puts "EXERCISE 1: A BALL DROPPED FROM A TOWER"
puts "\n"

height_of_a_ball_dropped from_height: 100, at_t_equal: 1
height_of_a_ball_dropped from_height: 100, at_t_equal: 2
height_of_a_ball_dropped from_height: 100, at_t_equal: 3
height_of_a_ball_dropped from_height: 100, at_t_equal: 4
height_of_a_ball_dropped from_height: 100, at_t_equal: 5

puts "\n"
