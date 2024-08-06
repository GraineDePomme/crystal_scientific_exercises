require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 7 : QUANTUM POTENTIAL STEP ===================================================
# 
# A particle of mass m with initial kinetic energy E and wavevector k1 = sqrt(2mE)/h_bar
# enters from the left and encounters a sudden jump in potential energy of ehight V
# at position x = 0.
# 
# By solving the Schrödinger equation, one can show that when E > V the particle may
# either pass the step, in which case it has a lower kinetic energy E - V on the other
# side and a correspondingly smaller wavevector of k2 = sqrt(2mE - 2mV) / h_bar, or it
# may be reflected, keeping all of its kinetic eergy and an unchanged wavevector but
# moving in the opposite direction. The probabilities T and R for transmission and
# reflection are given by :
# 
#       T = 4 * k1 * k2 / (k1 + k2)^2
#       R = ( (k1 - k2) / (k1 + k2) )^2
# 
# Suppose we have a particle with mass equal to the electron mass and energy 10eV
# encountering a potential step of height 9eV.
# 
# Write a function that computes and print out the transmision and reflection
# probabilities using the formula above.
# =======================================================================================

def wavevector_of_a_particle(of_mass m : Float64, and_energy e : Float64)
    return Math.sqrt(2 * m * e) / PhysicalConstants::PLANCK_CONSTANT_REDUCED
end

def transmission_probability(for_a_mass m : Float64, and_energy e : Float64, encountering_a_potential_of v : Float64)
    k1 = wavevector_of_a_particle of_mass: m, and_energy: e
    k2 = wavevector_of_a_particle of_mass: m, and_energy: (e - v)

    result = (4 * k1 * k2) / (k1 + k2)**2

    puts "The transmission probability for a particle of mass #{m} kg and energy #{e.round(2)} eV encountering a potential step of #{v} eV is : #{result.round(2)}\n"
end

def reflection_probability(for_a_mass m : Float64, and_energy e : Float64, encountering_a_potential_of v : Float64)
    k1 = wavevector_of_a_particle of_mass: m, and_energy: e
    k2 = wavevector_of_a_particle of_mass: m, and_energy: (e - v)

    result = ( (k1 - k2) / (k1 + k2) )**2

    puts "The reflection probability for a particle of mass #{m} kg and energy #{e.round(2)} eV encountering a potential step of #{v} eV is : #{result.round(2)}\n"
end

puts "\n"
puts "EXERCISE 7 : QUANTUM POTENTIAL STEP\n"
puts "\n"

transmission_probability for_a_mass: PhysicalConstants::Electron::MASS, and_energy: 10, encountering_a_potential_of: 9
reflection_probability for_a_mass: PhysicalConstants::Electron::MASS, and_energy: 10, encountering_a_potential_of: 9

puts "\n"