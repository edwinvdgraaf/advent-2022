def contains(left, right)
  left[0] >= right[0] && left[1] <= right[1]
end

def intersects(left, right)
  (left[0] >= right[0] && left[0] <= right[1]) || (left[1] <= right[1] && left[1] >= right[0])
end


def check_for_contain(first, second)
  if contains(first, second) || contains(second, first)
    return true
  end
  false
end

def check_for_intersect(first, second)
  if intersects(first, second) || intersects(second, first)
    return true
  end
  false
end


input =  File.open("./src/day-4/input.txt").read().split("\n")
total_contains = 0
total_intersect = 0

input.each do |line|
  left, right = line.strip().split(",")
  if check_for_contain(left.split("-").map(&:to_i), right.split("-").map(&:to_i))
    total_contains += 1
  end
  if check_for_intersect(left.split("-").map(&:to_i), right.split("-").map(&:to_i))
    total_intersect += 1
  end
end

puts "Part 1: #{total_contains}"
puts "Part 2: #{total_intersect}"

