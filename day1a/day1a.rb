#!/usr/bin/env ruby
# Usage: ./day1a.rb [input.txt | test]
def day1a(input)
  total = 0
  result = input.collect do |row|
    number = row.match(/[0-9]/)[0] + row.reverse.match(/[0-9]/)[0]
    total += number.to_i
  end
  total.to_s
end

if ARGV[0] == 'test'
  input = <<~TEST
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
  TEST
  expected_output = '142'
  output = day1a(input.split("\n"))
  if output == expected_output
    puts 'OK: test passed.'
  else
    puts "Failure:\nExpected: #{expected_output}\nActual: #{output}\nTest failed."
  end
else
  input = File.readlines(ARGV[0] || 'input.txt')
  puts day1a(input)
end
