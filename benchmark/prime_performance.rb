require 'benchmark'
require_relative '../lib/prime.rb'

(0..1000).step(50).each do |count|
  Benchmark.bm do |x|
    x.report(count) { Prime.generate_primes(count) }
  end
end
