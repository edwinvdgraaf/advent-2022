def part_1(input)
    lines = input.split("\n")
    
    # A, X = 1 🪨
    # B, Y = 2 📜
    # C, Z = 3 ✂️
    # lose = 0, draw 3, win 6
    score = lines.map { |line| 
        case line
        when "A X"
            3 + 1
        when "A Y"
            6 + 2
        when "A Z"
            0 + 3
        when "B X"
            0 + 1
        when "B Y"
            3 + 2
        when "B Z"
            6 + 3
        when "C X"
            6 + 1
        when "C Y"
            0 + 2
        when "C Z"
            3 + 3
        else
            puts line
            raise "Shouldnt be here: #{line}"
        end
    }.sum

    score
end

def part_2(input)
    lines = input.split("\n")
    
    # A, X = 1 🪨
    # B, Y = 2 📜
    # C, Z = 3 ✂️
    # lose = X, draw Y, win Z
    score = lines.map { |line| 
        case line
        when "A X"
            0 + 3
        when "A Y"
            3 + 1
        when "A Z"
            6 + 2
        when "B X"
            0 + 1
        when "B Y"
            3 + 2
        when "B Z"
            6 + 3
        when "C X"
            0 + 2
        when "C Y"
            3 + 3
        when "C Z"
            6 + 1
        else
            puts line
            raise "Shouldnt be here: #{line}"
        end
    }.sum

    score
end


file = File.open("./src/day-2/input.txt").read()
# Part 1
puts "Part 1: #{part_1(file)}"

# Part 2
puts "Part 2: #{part_2(file)}"
