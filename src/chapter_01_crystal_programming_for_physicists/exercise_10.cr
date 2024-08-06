# EXERCISE 10 : THE SEMI-EMPIRICAL MASS FORMULA =========================================
# 
# In nuclear physics, the semi_empirical mass formula is a formula for calculating the
# approximate nuclear binding energy B of an atomic nucleus with atomic number Z and mass
# number A:
# 
#       B = a1 * A - a2 * A^(2/3) - a3 * Z^2 / A^(1/3) - a4 * (A - 2Z)^2 / A + a5 / A^0.5
# 
# where, in units of millions of electron volts, the constants are a1 = 15.8, a2 = 18.3,
# a3 = 0.714, a4 = 23.2, and
# 
#          | = 0        if A is odd,
#       a5 | = 12.0     if A and Z are both even, 
#          | = -12.0    if A is even and Z is odd.
# 
# a) Write a function that takes as its input the values of A and Z, and prints out the
# binding energy for the corresponding atom.
# 
# b) Write a function that prints out not the total binding energy B, but the binding
# energy per nucleon, which is B/A.
# 
# c) Write a function that takes as input just a single value of the atomic number Z
# and then goes through all values of A from A = Z to A = 3Z, to find the one that has
# the largest binding energy per nucleon. This is the most stable nucleus with the given
# atomic number. Have your function print out the value of A for this most stable
# nucleus and the value of the binding energy per nucleon.
# 
# d) Write a function that, runs through all values of Z from 1 to 100 and prints out the
# most stable value of A for each one.
# =======================================================================================

def nuclear_binding_energy(with_atomic_number z : Int32, and_mass_number a : Int32)
    a1 = 15.8
    a2 = 18.3
    a3 = 0.714
    a4 = 23.2

    a5 = 0.0
    if a.odd?
        a5 = 0.0
    else
        if z.even?
            a5 = 12.0
        else
            a5 = -12.0
        end
    end

    return a1 * a -
           a2 * a**(2/3) -
           a3 * z**2 / a**(1/3) -
           a4 * (a - 2 * z)**2 / a +
           a5 / Math.sqrt(a)
end

def nuclear_binding_energy_per_nucleon(with_atomic_number z : Int32, and_mass_number a : Int32)
    return (nuclear_binding_energy with_atomic_number: z, and_mass_number: a) / a
end

def largest_binding_energy_per_nucleon(for_atomic_number z : Int32)
    binding_energy_per_nucleon = 0.0
    most_stable_mass_number = 0
    (z..(3*z)).each do |a|
        tmp_binding_energy = nuclear_binding_energy_per_nucleon with_atomic_number: z, and_mass_number: a
        if tmp_binding_energy > binding_energy_per_nucleon
            binding_energy_per_nucleon = tmp_binding_energy
            most_stable_mass_number = a
        end
    end

    puts "The most stable nucleus with the atomic number #{z} has a mass number #{most_stable_mass_number} and a binding energy per nucleon of about #{binding_energy_per_nucleon.round(3)} MeV."
end

def most_stable_atoms
    (1..100).each do |z|
        largest_binding_energy_per_nucleon for_atomic_number: z
    end
end

binding_energy_nickel = nuclear_binding_energy with_atomic_number: 28, and_mass_number: 58
binding_energy_per_nucleon_nickel = nuclear_binding_energy_per_nucleon with_atomic_number: 28, and_mass_number: 58

puts "\n"
puts "EXERCISE 10 : THE SEMI-EMPIRICAL MASS FORMULA\n"
puts "\n"

puts "The binding energy of an atom with Z = 28 and A = 58 is about #{binding_energy_nickel.round(2)} MeV."
puts "The binding energy per nucleon of an atom with Z = 28 and A = 58 is about #{binding_energy_per_nucleon_nickel.round(2)} MeV."

puts "\n"
most_stable_atoms
puts "\n"