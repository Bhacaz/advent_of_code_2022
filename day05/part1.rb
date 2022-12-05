class Stack
  attr_reader :number

  def initialize(number, crates)
    @number = number
    @crates = crates
  end

  def pop
    @crates.shift
  end

  def add(crate)
    @crates.unshift(crate)
  end

  def top
    @crates.first
  end
end

class Part < BasePart
  Move = Struct.new(:size, :from, :to)

  def run
    input
    @moves.each do |move|
      stack_from = @stacks[move.from]
      stack_to = @stacks[move.to]
      move.size.times do
        stack_to.add(stack_from.pop)
      end
    end
    @stacks.values.map(&:top).join
  end

  MOVE_REGEX = /move (\d+) from (\d+) to (\d+)/

  def input
    input = InputFetcher.fetch.split("\n\n")
    initial_stacks = input.first
    stacks = initial_stacks.split("\n").map do |line|
      line.chars.each_slice(4)
    end

    array_of_stacks = []
    stacks.each do |line_stack|
      line_stack.each_with_index do |stack, index|
        array_of_stacks[index] ||= []
        letter = stack.join('').scan(/\w/).first
        array_of_stacks[index] << letter if letter
      end
    end

    @stacks = {}
    array_of_stacks.map do |stack|
      s = Stack.new(stack.pop.to_i, stack)
      @stacks[s.number] = s
    end

    @moves = input.last.split("\n").map do |line|
      Move.new(*line.scan(MOVE_REGEX).first.map(&:to_i))
    end
  end
end

# -------- Day: 05, Part: 1 --------
# | Duration	| 1.35 ms	|
# | Allocated	| 6597		|
# | Result	| ZBDRNPMVH	|
# ---------------------------------
