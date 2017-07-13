module Primes

export prime_factors


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

function prime_factors(n, result=[])

    current_prime = 2
    while (n % current_prime) != 0
        current_prime = next_prime(current_prime)
    end

    if is_prime(n, _primes)
        push!(result, n)
        return result
    end
    push!(result, current_prime)

    return prime_factors(n / current_prime, result)
end


end # End of Module Primes
