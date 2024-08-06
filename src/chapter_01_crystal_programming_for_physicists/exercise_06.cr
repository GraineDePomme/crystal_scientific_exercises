require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 6 ============================================================================
# 
# A spaceship travels from Earth in a straight line at relativistic speed v to another
# planet x light years away.
# 
# Write a function that takes the value of x and the speed v as a fraction of the speed
# of light c, then prints out the time in years that the spaceship takes to reach its
# destination:
# 
#   a) In the rest frame of an observer on Earth.
#   b) As perceived by a passenger on board the ship.
# 
# Use this function to calculate the answer for a planet 10 light years away
# with v = 0.99c.
# =======================================================================================

def time_to_travel(a_distance_of x : Float64, at_speed v, as_perceived_by ref_frame : String)
    if ref_frame == "Earth"
        t = x / v
        puts "It takes #{t.round(2)} years to travel #{x} light-years at a speed of #{v} times the speed of light from the point of view of an observer on Earth.\n"
    elsif ref_frame == "Passenger"
        t = (x / v) * Math.sqrt(1 - v**2)
        puts "It takes #{t.round(2)} years to travel #{x} light-years at a speed of #{v} times the speed of light from the point of view of the passenger.\n"
    else
        raise "wrong value for the frame of reference!"
    end
end

puts "\n"
puts "EXERCISE 6\n"
puts "\n"

time_to_travel a_distance_of: 10, at_speed: 0.99, as_perceived_by: "Earth"
time_to_travel a_distance_of: 10, at_speed: 0.99, as_perceived_by: "Passenger"

puts "\n"