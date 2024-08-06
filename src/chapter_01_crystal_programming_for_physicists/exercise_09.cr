require "physical_constants"
require "crystal_scientific_library"

# EXERCISE 9 : THE MADELUNG CONSTANT ====================================================
# 
# In condensed matter physics the Madelung constant gives the total electric potential
# felt by an atom in a solid. It depends on the charges of the other atoms nearby and
# their locations. Consider for instance solid sodium chloride (table salt). The sodium
# chloride crystal has atoms arranged on a cubic lattice, but with aternating sodium
# and chlorine atoms, the sodium ones having a single positive charge +e and the chlorine
# ones a single negative charge -e, where e is the charge of the electron. If we label
# each position on the lattice by three integer coordinates (i, j, k), then the sodium
# atoms fall at positions where i + j + k is even, and the chlorine atoms at positions 
# where i + j + k is odd.
# 
# Consider a sodium atom at the origin, i = j = k = 0, and let us calculate the
# Madelung constant. If the spacing of atoms on the lattice is a, then the distance from
# the origin to the atom at position (i, j, k) is
# 
#       sqrt( (ia)^2 + (ja)^2 + (ka)^2 ) = a * sqrt( i^2 + j^2 + k^2 )
#
# and the potential at the origin created by such an atom is
# 
#       V(i, j, k) = +- e / (4 * pi * e0 * a * sqrt( i^2 + j^2 + k2 ))
# 
# where e0 being the permittivity of the vacuum and the sign of the expression
# depending on whether i + j + k is even or odd. The total potential felt by the sodium
# atom is then the sum of this quantity over all the atoms. Let us assume a cubic box
# around the sodium at the origin, with L atoms in all directions. Then
# 
#       V_total = sum from i, j, k = L and not i=j=k=0 to L of V(i, j, k)
#               = (e * M) / (4 * pi * e0 * a)
# 
# Where M is the Madelung constant, at least approximately. Technically the Madelung 
# constant is the value of M where L -> infinity, but one can get a good approximation
# just by using a large value of L.
# 
# Write a function that calculates and prints out the Madelung constant for sodium
# chloride. Use as large a value of L as you can, while still having your progrma run 
# in reasonnable time (say a minute or less).
# =======================================================================================

a = 5.64e-10            # Distance between atoms in m
    l = 100                # Size of the lattice
    e = PhysicalConstants::ELEMENTARY_CHARGE
    e0 = PhysicalConstants::VACUUM_ELECTRIC_PERMITTIVITY

    v_total = 0

    (-l..l).each do |i|
        (-l..l).each do |j|
            (-l..l).each do |k|
                if {i, j, k} == {0, 0, 0}
                    next # We do nothing in that case
                elsif (i + j + k).even?
                    v_total -= e / (4 * Math::PI * e0 * a) / ( Math.sqrt(i**2 + j**2 + k**2) )
                else
                    v_total += e / (4 * Math::PI * e0 * a) / ( Math.sqrt(i**2 + j**2 + k**2) )
                end
            end
        end
    end

    madelung_constant = v_total / e * (4 * Math::PI * e0 * a)

    puts "\n"
    puts "EXERCISE 9 : THE MADELUNG CONSTANT\n"
    puts "\n"

    puts "The madelung constant for a cristal of sodium chloride is about #{madelung_constant.round(4)}."
    
    puts "\n"