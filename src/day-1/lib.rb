
lines = File.open("./src/day-1/input-1.txt").read().split("\n\n")
elfs_cal = lines.map { |x|
    sum = x.split("\n").map {
        |x| x.to_i
    }.sum()
}.sort

puts elfs_cal.inspect
puts "Largest: #{elfs_cal[elfs_cal.length - 1]}"
puts "Largest 3 combined: #{elfs_cal[elfs_cal.length - 1] + elfs_cal[elfs_cal.length - 2] + elfs_cal[elfs_cal.length - 3]}"

