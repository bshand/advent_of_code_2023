#!/usr/bin/env ruby
# Usage: ./day1b.rb [input.txt | test]
def first_digit(row, reverse:)
  dict = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
           'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
           'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }
  if reverse
    dict = dict.collect { |k, v| [k.reverse, v] }.to_h
    row = row.reverse
  end
  dict_re = dict.keys.collect { |key| Regexp.escape(key) }.join('|')
  match = row.match(dict_re)[0]
  dict[match]
end

def day1b(input)
  total = 0
  result = input.collect do |row|
    total += first_digit(row, reverse: false) * 10 + first_digit(row, reverse: true)
  end
  total.to_s
end

if ARGV[0] == 'test'
  input = <<~TEST
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
  TEST
  expected_output = '281'
  output = day1b(input.split("\n"))
  if output == expected_output
    puts 'OK: test passed.'
  else
    puts "Failure:\nExpected: #{expected_output}\nActual: #{output}\nTest failed."
  end
else
  input = File.readlines(ARGV[0] || 'input.txt')
  puts day1b(input)
end
