# A palindromic number reads the same both ways.
# The largest palindrome made from the product
# of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

function is_palindrome(n)
    s = string(n)
    return s == reverse(s)
end


@assert is_palindrome(2)
@assert is_palindrome(11)
@assert is_palindrome(9009)
@assert is_palindrome(90109)
@assert is_palindrome(90209)


function find_next_palindrome_decreasing(n)
    while !is_palindrome(n)
        n -= 1
    end
    return n
end

@assert find_next_palindrome_decreasing(10000) == 9999
@assert find_next_palindrome_decreasing(9998) == 9889

function is_divisible_by_digits(n, digits)
    # Checks if a number is divisible by two x digits number
    max = (10 ^ digits) - 1
    min = minimum([max, trunc(Int, n / (10 ^ digits) + 1)])
    println(max)
    println(min)

    for i in range(max, min-max)
        println(n/i)
        if n % i == 0 && (n / i) <= max
            return true
        end
    end
    return false
end

@assert is_divisible_by_digits(9999, 2) == false
@assert is_divisible_by_digits(9009, 2) == true


function compute_palindrome_by_factors(n, digit)
    while !is_palindrome(n) && !is_divisble_by_digits(n, digit)
        n = find_next_palindrome_decreasing(n)
    end
    return n
end

@assert compute_palindrome_by_factors(99*99,2) == 9009
println(compute_palindrome_by_factors(999*999, 3))
