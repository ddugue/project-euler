function is_prime(n, prime_list)
    # Return true if n is a prime
    for prime in prime_list
        if n % prime == 0
            return false
        end
    end
    return true
end

function get_primes(max)
    primes = [2, 3]
    c = 4
    while c < max
        c += 1
        if is_prime(c, primes)
            push!(primes, c)
        end
    end
    return primes
end

function highest_prime_factor(n)
    primes = get_primes(n)
    inx = findlast(x -> n % x == 0, primes)
    return primes[inx]
end

@assert highest_prime_factor(9) == 3
@assert highest_prime_factor(12) == 3
@assert highest_prime_factor(11) == 11
@assert highest_prime_factor(15) == 5
println(highest_prime_factor(1001))
# println(highest_prime_factor(600851475143))
