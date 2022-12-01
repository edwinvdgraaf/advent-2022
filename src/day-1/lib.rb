
lines = File.open("./src/day-1/input-1.txt").read().split("\n\n")
elfs_cal = lines.map { |x|
    x.split("\n").map {
        |x| x.to_i
    }.sum()
}.sort

puts "Largest: #{elfs_cal.last()}"
puts "Largest 3 combined: #{elfs_cal.last(3).sum()}"

