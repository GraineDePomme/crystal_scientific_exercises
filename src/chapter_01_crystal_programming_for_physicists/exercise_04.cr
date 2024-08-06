require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 4 : CONVERTING POLAR COORDINATES =============================================
# 
# Suppose the position of a point in two_dimensional space is given to us in polar 
# coordinates (r, theta) with theta expressed in degrees. 
# 
# Write a Crystal function to convert it to Cartesian coordinates (x, y) and print the
# result of the conversion.
# =======================================================================================

def convert_polar_to_cartesian(r : Float64, theta_degree : Float64)
    theta_radian = CrystalScientificLibrary.convert_angle theta_degree, from: "degree", to: "radian"

    x = r * Math.cos(theta_radian)
    x = x.round(4)

    y = r * Math.sin(theta_radian)
    y = y.round(4)

    puts "The polar coordinates (#{r}, #{theta_degree}°) are equivalent to the Cartesian coordinates (#{x}, #{y})\n"
end

puts "\n"
puts "EXERCISE 4 : CONVERTING POLAR COORDINATES (from scratch)"
puts "\n"

convert_polar_to_cartesian r: 2, theta_degree: 60
convert_polar_to_cartesian r: 1, theta_degree: 45
convert_polar_to_cartesian r: 2, theta_degree: 180

puts "\n"


# =======================================================================================
# The crystal Scientific Library provides a build-in function to convert coordinates
# from one coordinate system to another.
# 
# Here is a demonstration of how it works.
# =======================================================================================

puts "\n"
puts "EXERCISE 4 : CONVERTING POLAR COORDINATES (using the Crystal Scientific Library)"
puts "\n"

theta_radian = CrystalScientificLibrary.convert_angle 60, from: "degree", to: "radian"
cartesian_coordinates = CrystalScientificLibrary.convert_coordinates r: 2, theta: theta_radian, from: "polar", to: "cartesian"
puts "The polar coordinates (2, 60°) are equivalent to the Cartesian coordinates (#{cartesian_coordinates}\n"


theta_radian = CrystalScientificLibrary.convert_angle 45, from: "degree", to: "radian"
cartesian_coordinates = CrystalScientificLibrary.convert_coordinates r: 1, theta: theta_radian, from: "polar", to: "cartesian"
puts "The polar coordinates (1, 45°) are equivalent to the Cartesian coordinates (#{cartesian_coordinates}\n"


theta_radian = CrystalScientificLibrary.convert_angle 180, from: "degree", to: "radian"
cartesian_coordinates = CrystalScientificLibrary.convert_coordinates r: 2, theta: theta_radian, from: "polar", to: "cartesian"
puts "The polar coordinates (2, 180°) are equivalent to the Cartesian coordinates (#{cartesian_coordinates}\n"

puts "\n"
