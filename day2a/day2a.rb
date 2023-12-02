#!/usr/bin/env ruby
# Usage: ./day2a.rb [input.txt | test]

def possible_game?(row, reds:, greens:, blues:)
  row.split(': ')[1].split('; ').each do |attempt|
    return false if (attempt.match(/([0-9]*) red/).to_a[1] || 0).to_i > reds
    return false if (attempt.match(/([0-9]*) green/).to_a[1] || 0).to_i > greens
    return false if (attempt.match(/([0-9]*) blue/).to_a[1] || 0).to_i > blues
  end
  true
end

def day2a(input)
  total = 0
  result = input.collect do |row|
    game_id = row.match(/Game ([0-9]*)/)[1].to_i
    total += game_id if possible_game?(row, reds: 12, greens: 13, blues: 14)
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
  expected_output = '8'
  output = day2a(input.split("\n"))
  if output == expected_output
    puts 'OK: test passed.'
  else
    puts "Failure:\nExpected: #{expected_output}\nActual: #{output}\nTest failed."
  end
else
  input = File.readlines(ARGV[0] || 'input.txt')
  puts day2a(input)
end
