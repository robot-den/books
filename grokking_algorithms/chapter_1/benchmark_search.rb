# frozen_string_literal: true

require 'benchmark/ips'

SORTED_ARRAY = (0..100).to_a

Benchmark.ips do |x|
  x.report('simple-search') do
    value = rand(SORTED_ARRAY.size)

    SORTED_ARRAY.each do |elem|
      break if elem == value
    end
  end

  x.report('binary-search') do
    value = rand(SORTED_ARRAY.size)

    low = 0
    high = SORTED_ARRAY.size - 1

    while low <= high
      mid = (low + high) / 2
      guess = SORTED_ARRAY[mid]

      if guess == value
        break
      elsif guess > value
        high = mid - 1
      else
        low = mid + 1
      end
    end
  end

  x.compare!
end