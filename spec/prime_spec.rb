require 'spec_helper'

describe Prime do

  let(:primes_db) do
    [
       2,  3,  5,  7, 11,  13,  17,  19,  23,  29,
      31, 37, 41, 43, 47,  53,  59,  61,  67,  71,
      73, 79, 83, 89, 97, 101, 103, 107, 109, 113
    ]
  end

  describe ".at" do
    it "returns a Fixnum" do
      expect(Prime.at(9)).to be_a(Fixnum)
    end

    it "returns the correct prime" do
      10.times do
        random_position = Random.rand(0..(primes_db.size-1))
        expect(Prime.at(random_position)).to eq(primes_db[random_position])
      end
    end

    context "when prime not already generated" do
      # Reset the cache
      before(:each) { Prime.class_variable_set :@@prime_set, [] }

      it "generates primes" do
        expect(Prime).to receive(:generate_primes).and_return(primes_db)
        Prime.at(9)
      end
    end

    context "when prime already generated" do
      # Reset the cache
      before(:each) { Prime.class_variable_set :@@prime_set, [] }

      it "gets the prime from the cache" do
        Prime.at(9) # Generate cache

        expect(Prime).not_to receive(:generate_primes)
        Prime.at(9)
      end
    end
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
