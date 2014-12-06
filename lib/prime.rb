class Prime

  def self.generate_primes(count)
    potential_prime = 2
    prime_set = [potential_prime]

    while prime_set.count < count
      potential_prime += 1

      unless prime_set.map { |prime| potential_prime % prime == 0 }.any?
        prime_set << potential_prime
      end
    end

    prime_set
  end

end
