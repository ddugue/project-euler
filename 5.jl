# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10
# without any remainder.
# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?

# (1,2) (1,3) Means 1 * 2 * 1 * 3
# (2,2) means 2 * 2
include("./primes.jl")
using Primes


function pop(arr, value)
    inx = findfirst(x -> x == value, arr)
    if inx != 0
        deleteat!(arr, inx)
        return value
    end
    return 0
end


function merge(factor_set_1, factor_set_2)
    results = []
    for factor in factor_set_1
        pop(factor_set_2, factor)
        push!(results, factor)
    end

    for factor in factor_set_2
        push!(results, factor)
    end
    return results
end


@assert Primes.prime_factors(2) == [2]
@assert Primes.prime_factors(4) == [2,2]
@assert Primes.prime_factors(8) == [2,2,2]
@assert Primes.prime_factors(21) == [3,7]

@assert merge([2,2], [2,2,3]) == [2,2,3]
@assert merge([2,7], [2,2,3]) == [2,7,2,3]
@assert merge([7], [2,3,3]) == [7,2,3,3]

function min_common_factor(nb)
    factors = map(x -> Primes.prime_factors(x), 2:nb)
    min_factors = reduce(merge, [], factors)
    return prod(min_factors)
end

@assert min_common_factor(10) == 2520
println(min_common_factor(20))
