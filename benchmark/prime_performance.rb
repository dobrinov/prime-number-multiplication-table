require_relative '../lib/prime.rb'

suite_start_time = Time.now

(0..1000).step(50).each do |count|
  iteration_start_time = Time.now
  Prime.at(count)
  iteration_end_time = Time.now

  puts "%{prime_count} primes \t %{duration} seconds" % {
    prime_count: count,
    duration: (iteration_end_time - iteration_start_time).round(3)
  }
end

suite_end_time = Time.now

puts "\n"

puts "Total: \t\t %{duration} seconds" % {
  duration: (suite_end_time - suite_start_time).round(3)
}
