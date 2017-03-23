_primes = [2, 3]

function is_prime(n, known_primes)
    for prime in known_primes
        if n == prime || prime > n
            return true
        end
        if n % prime == 0
            return false
        end
    end
    return true
end



function next_prime(n)
    inx = findfirst(x -> x > n, _primes)
    if inx == 0
        # Compute prime
        x = n + 1
        while !is_prime(x, _primes)
            x+=1
        end
        push!(_primes, x)
        return x
    end
    return _primes[inx]
end

function find_highest_prime_factor(n)

    current_prime = 2
    while (n % current_prime) != 0
        current_prime = next_prime(current_prime)
    end

    if is_prime(n, _primes)
        return n
    end
    return find_highest_prime_factor(n / current_prime)
end
@assert is_prime(2, _primes) == true
@assert is_prime(6, _primes) == false
@assert next_prime(2) == 3
@assert next_prime(3) == 5
@assert find_highest_prime_factor(6) == 3
@assert find_highest_prime_factor(11) == 11
@assert find_highest_prime_factor(15) == 5
@assert find_highest_prime_factor(21) == 7
@assert find_highest_prime_factor(26) == 13
println(find_highest_prime_factor(13195))
@assert find_highest_prime_factor(13195) == 29
println(find_highest_prime_factor(600851475143))
