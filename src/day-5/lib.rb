class Dock
  def initialize(initial_state, options = {:is_9001 => false})
    @stacks = build_stacks(initial_state)
    @options = options

    
  end

  # move 3 from 1 to 3
  def apply_move(move)
    match = move.match(/move (\d+) from (\d+) to (\d+)/)
    
    amount_of_crates = match[1].to_i
    from = match[2].to_i - 1
    to = match[3].to_i - 1

    
    if @options[:is_9001]
      @stacks[to] += @stacks[from].pop(amount_of_crates)
    else
      amount_of_crates.times { @stacks[to] << @stacks[from].pop() }    
    end

  end

  def display_stack
    puts " === STACK ==="
    @stacks.each_with_index do |stack, index|
      puts "#{index + 1}: #{stack.inspect}" 
    end
  end

  def display_top
   crates = @stacks.map do |stack|
      stack.last()
    end

    puts crates.join("").tr('[]', '')
  end
  
  private
  def build_stacks(initial_state)
    stacks = []
    initial_state.each_line do |line|
      line.chars.each_slice(4).map(&:join).each_with_index do |crate, index|
        stack = stacks[index] || [] 
        if(crate.strip().length > 1)
          stack.unshift(crate.strip())
        end
        stacks[index] = stack
      end
    end
    stacks
  end
end

dock_lines, move_lines = File.open("./src/day-5/input.txt").read().split("\n\n")

dock = Dock::new(dock_lines, {:is_9001 => true})

dock.display_stack()

move_lines.each_line { |line| dock.apply_move(line) }

dock.display_stack()
dock.display_top()
