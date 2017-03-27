
function fibonacci_even(max, x, y, results)
    # Simple recursive fibonacci that returns
    # the even numbers
    if y > max
        return results
    end
    if y % 2 == 0
        push!(results, y)
    end
    return fibonacci_even(max, y, x+y, results)
end
@assert sum(fibonacci_even(9, 1, 2, []) ) == 10
@assert sum(fibonacci_even(14, 1, 2, []) ) == 10
println(sum(fibonacci_even(4e6+1, 1, 2, [])))
