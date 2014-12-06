require 'spec_helper'

describe Prime do

  let(:primes_db) do
    [
       2,  3,  5,  7, 11,  13,  17,  19,  23,  29,
      31, 37, 41, 43, 47,  53,  59,  61,  67,  71,
      73, 79, 83, 89, 97, 101, 103, 107, 109, 113
    ]
  end

  describe ".generate_primes" do
    it "returns an Array" do
      expect(Prime.generate_primes(10)).to be_a(Array)
    end

    it "returns prime numbers only" do
      expect(Prime.generate_primes(primes_db.size)).to eq(primes_db)
    end

    it "returns the correct number of primes" do
      10.times do
        random_count = Random.rand(1..primes_db.size)
        expect(Prime.generate_primes(random_count).size).to eq(random_count)
      end
    end
  end
end
