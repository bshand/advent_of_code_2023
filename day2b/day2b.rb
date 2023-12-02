#!/usr/bin/env ruby
# Usage: ./day2b.rb [input.txt | test]

def game_power(row)
  max_reds = nil
  max_greens = nil
  max_blues = nil
  row.split(': ')[1].split('; ').each do |attempt|
    max_reds = [max_reds, (attempt.match(/([0-9]*) red/).to_a[1] || 0).to_i].compact.max
    max_greens = [max_greens, (attempt.match(/([0-9]*) green/).to_a[1] || 0).to_i].compact.max
    max_blues = [max_blues, (attempt.match(/([0-9]*) blue/).to_a[1] || 0).to_i].compact.max
  end
  max_reds * max_greens * max_blues
end

def day2b(input)
  total = 0
  result = input.collect do |row|
    total += game_power(row)
  end
  total.to_s
end

if ARGV[0] == 'test'
  input = <<~TEST
    Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
  TEST
  expected_output = '2286'
  output = day2b(input.split("\n"))
  if output == expected_output
    puts 'OK: test passed.'
  else
    puts "Failure:\nExpected: #{expected_output}\nActual: #{output}\nTest failed."
  end
else
  input = File.readlines(ARGV[0] || 'input.txt')
  puts day2b(input)
end
