require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 5 : CONVERTING CARTESIAN COORDINATES =========================================
# 
# Suppose the position of a point in two_dimensional space is given to us in cartesian 
# coordinates (x, y).
# 
# Write a Crystal function to convert it to polar coordinates (r, theta) and print the
# result of the conversion with theta expressed in degrees.
# =======================================================================================

def convert_cartesian_to_polar(x : Float64, y : Float64)
    r = Math.sqrt(x * x + y * y)

    theta = Math.acos(x / r)
    theta = CrystalScientificLibrary.convert_angle theta, from: "radian", to: "degree"

    r = r.round(2)
    theta = theta.round(2)

    puts "The cartesian coordinates (#{x}, #{y}) are equivalent to the polar coordinates (#{r}, #{theta}°)\n"
end


puts "\n"
puts "EXERCISE 5 : CONVERTING CARTESIAN COORDINATES (from scratch)\n"
puts "\n"

convert_cartesian_to_polar x: 1, y: 1
convert_cartesian_to_polar x: -1, y: 1
convert_cartesian_to_polar x: -7, y: 3.2
convert_cartesian_to_polar x: 0, y: 2

puts "\n"


# =======================================================================================
# The crystal Scientific Library provides a build-in function to convert coordinates
# from one coordinate system to another.
# 
# Here is a demonstration of how it works.
# =======================================================================================

puts "EXERCISE 5 : CONVERTING CARTESIAN COORDINATES (using the Crystal Scientific Library)"
puts "\n"

polar_coordinates = CrystalScientificLibrary.convert_coordinates x: 1, y: 1, from: "cartesian", to: "polar"
puts "The cartesian coordinates (1, 1) are equivalent to the polar coordinates (#{polar_coordinates}\n"

polar_coordinates = CrystalScientificLibrary.convert_coordinates x: -1, y: 1, from: "cartesian", to: "polar"
puts "The cartesian coordinates (1, 1) are equivalent to the polar coordinates (#{polar_coordinates}\n"

polar_coordinates = CrystalScientificLibrary.convert_coordinates x: -7, y: 3.2, from: "cartesian", to: "polar"
puts "The cartesian coordinates (1, 1) are equivalent to the polar coordinates (#{polar_coordinates}\n"

polar_coordinates = CrystalScientificLibrary.convert_coordinates x: 0, y: 2, from: "cartesian", to: "polar"
puts "The cartesian coordinates (1, 1) are equivalent to the polar coordinates (#{polar_coordinates}\n"

puts "\n"
