require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 3 : ALTITUDE OF A SATELLITE ==================================================
# 
# A satellite is to be launched into a circular orbit around the Earth so that it orbits
# the planet once every T seconds. Its altitude h above earth's surface is given by:
# 
#       h = (G*M*T^2 / 4*pi^2)^(1/3) - R
# 
#       Where G is Newton's gravitational constant, M is t he mass of the Earth,
#       and R is its radius.
# 
# a) Write a Crystal function that calculate and prints out the altitude in meters for 
#    a given value of T.
# 
# b) Use the function to calculate the altitude of a satellite that orbit the Earth
#    once a day, once every 90 minutes, and once every 45 minutes.
# 
# c) Technically a geosynchronous satellite is one that orbits the Earth once per sideral
#    day, which is 23.93 hours, not 24 hours. How much difference does it make to the
#    altitude of the satellite?
# 
# The Newton's gravitation constant, and the Earth's mass and radius can be found in the
# Physical Constants Library under PhysicalConstants::GRAVITATIONAL_CONSTANT,
# PhysicalConstants::Earth::MASS, and PhysicalConstants::Earth::EQUATORIAL_RADIUS.
# =======================================================================================

def altitude_above_earth(with_a_period_of t : Float64)
    g = PhysicalConstants::GRAVITATIONAL_CONSTANT
    m = PhysicalConstants::Earth::MASS
    r = PhysicalConstants::Earth::EQUATORIAL_RADIUS

    h = ((g * m * t**2 / (4 * Math::PI ** 2)) ** (1/3) - r)

    puts "A satellite orbiting Earth in #{t} seconds must have an altitude of #{h.to_i} meters."
end


puts "\n"
puts "EXERCISE 3 : ALTITUDE OF A SATELLITE\n"
puts "\n"

puts "A satellite orbiting Earth in one year :"
altitude_above_earth with_a_period_of: 86400

puts "\nA satellite orbiting Earth in one sideral year :"
altitude_above_earth with_a_period_of: 86148

puts "\nA satellite orbiting Earth in 90 minutes :"
altitude_above_earth with_a_period_of: 5400

puts "\nA satellite orbiting Earth in 45 minutes :"
altitude_above_earth with_a_period_of: 2700

puts "\n"