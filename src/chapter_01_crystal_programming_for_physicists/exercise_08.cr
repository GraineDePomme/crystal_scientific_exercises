require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 8 : PLANETARY ORBITS =========================================================
# 
# The orbit in space of one body around another, such as a planet around the Sun, does
# not have to be circular. In general it takes the form of an ellipse, with the body
# something closer in and sometimes further out. If you are given the distance l1 of
# closest approach that a planet makes to the Sun (also called its perihelion), and its
# linear velocity v1 at perihelion, then any other property of the orbit can be 
# calculated from these two.
# 
# Kepler's second law tells us that the distance l2 and velocity v2 of the planet at
# its most distant point (or aphelion) satisfy l2 * v2 = l1 * v1.
# At the same time, the total energy (kinematic plus gravitational) of a planet with
# velocity v and distance r from the Sun is given by:
# 
#       E = 0.5 * m * v^2 - G * m * M / r
# 
# where m is the planet's mass, M is the mass of the Sun, and G is Newton's
# gravitational constant.
# 
# Ultimately, we can say that v2 is the smaller root of the quadatic equation
# 
#       v2^2 - (2 * G * M) / (v1 * l1) - (v1^2 - 2 * G * M / l1) = 0
# 
# Once we have v2 we can calculate l2 using Kepler's second law.
# 
# Given the values of v1, l1, and l2, other parameters of the orbit are given by
# simple formulas:
# 
#       Semi-major axis: a = 0.5 * (l1 + l2)
#       Semi-minor axis: b = sqrt(l1 * l2)
#       Orbital period: T = (2 * pi * a * b) / (l1 * v1)
#       Orbital eccentricity: e = (l2 - l1) / (l2 + l1)
# 
# Write a program that takes the distance to the Sun and the velocity of an object
# at perihelion, then calculates and prints the quantities l2, v2, T, e.
# =======================================================================================

def velocity_at_aphelion(given_perihelion_speed v1 : Float64, and_perihelion_distance l1 : Float64)
    g = PhysicalConstants::GRAVITATIONAL_CONSTANT
    m = PhysicalConstants::Sun::MASS

    a = 1
    b = - (2 * g * m) / (v1 * l1)
    c = (2 * g * m) / l1 - v1**2

    delta = b**2 - 4 * a * c

    x1 = (-b - Math.sqrt(delta)) / (2 * a)
    x2 = (-b + Math.sqrt(delta)) / (2 * a)

    return Math.min(x1, x2)
end

def distance_at_aphelion(given_perihelion_speed v1 : Float64, and_perihelion_distance l1 : Float64)
    v2 = velocity_at_aphelion(given_perihelion_speed: v1, and_perihelion_distance: l1)
    return (l1 * v1) / v2
end

def prints_orbital_parameters(given_perihelion_speed v1 : Float64, and_perihelion_distance l1 : Float64)
    l2 = distance_at_aphelion given_perihelion_speed: v1, and_perihelion_distance: l1
    v2 = velocity_at_aphelion given_perihelion_speed: v1, and_perihelion_distance: l1

    a = 0.5 * (l1 + l2)
    b = Math.sqrt(l1 * l2)
    t = (Math::TAU * a * b) / (l1 * v1)
    e = (l2 - l1) / (l2 + l1)

    puts "An object having a perihelion distance of : #{l1} m and a perihelion speed of #{v1} m/s has an orbital period of #{t.round.to_i64} s and an orbital eccentricity of #{e.round(2)}°.\n"
end

puts "\n"
puts "EXERCISE 8 : PLANETARY ORBITS\n"
puts "\n"

prints_orbital_parameters given_perihelion_speed: 3.0287e4, and_perihelion_distance: 1.4710e11
prints_orbital_parameters given_perihelion_speed: 5.4529e4, and_perihelion_distance: 8.7830e10

puts "\n"