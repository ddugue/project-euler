function sum_n_below(factor, max)
    # Return the sum of all the natural numbers of factor below max
    max_nb = div(max-1,factor)
    ((factor / 2 * max_nb * (max_nb + 1)))
end

function n_below(n)
    # Return all the natural number of 3 and 5 multipliers
    return sum_n_below(3, n) + sum_n_below(5, n) - sum_n_below(3*5, n)
end

@assert n_below(10) == 23
println(n_below(1000))
