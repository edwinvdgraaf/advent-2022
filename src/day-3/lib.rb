
def find_double_item(line)
    split = line.length / 2
    first_compartment = line[0..split -1]
    second_compartment = line[split..line.length]

    first_compartment.split("").intersection(second_compartment.split("")).join("")
end

def find_badge(lines)
    first_bag, second_bag, third_bag = lines

    (first_bag.split("").intersection(second_bag.split(""))).intersection(third_bag.split("")).join("")
end

def score_item(item)
    code = item.ord
    if 97 <= code && code <= 122
      return code - 96
    elsif 65 <= code && code <= 90
      return code - 64 + 26 
    end
    
    raise "how did I get here?"
end

input = File.open("./src/day-3/input.txt").read().split("\n")

part_1 = input
    .map { |bag| find_double_item(bag)} 
    .map { |item| score_item(item) }
    .sum()


part_2 = input
    .each_slice(3)
    .map { |bags| find_badge(bags) }
    .map { |item| score_item(item) }
    .sum()

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"