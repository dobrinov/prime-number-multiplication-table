class Prime

  @@prime_set = []

  def self.at(position)
    if @@prime_set[position].nil?
      @@prime_set = Prime.generate_primes(position+1)
    end

    @@prime_set[position]
  end

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
