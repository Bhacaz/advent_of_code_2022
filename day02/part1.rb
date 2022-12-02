class Game
  ROCK = :rock
  PAPER = :paper
  SCISSORS = :scissors

  def initialize(opponent, me)
    @opponent = tool(opponent)
    @me = tool(me)
  end

  def tool(i)
    case i
    when 'A', 'X'
      ROCK
    when 'B', 'Y'
      PAPER
    when 'C', 'Z'
      SCISSORS
    end
  end

  def win?
    case @me
    when @opponent
      nil
    when ROCK
      @opponent == SCISSORS
    when PAPER
      @opponent == ROCK
    when SCISSORS
      @opponent == PAPER
    end
  end

  def tool_points(tool)
    case tool
    when ROCK
      1
    when PAPER
      2
    when SCISSORS
      3
    end
  end

  def score
    if win?.nil?
      3 + tool_points(@me)
    elsif win?
      6 + tool_points(@me)
    else
      tool_points(@me)
    end
  end
end


class Part < BasePart
  def run
    input.sum(&:score)
  end

  def input_parser(input)
    input.map do |line|
      Game.new(*line.split(' '))
    end
  end
end

# -------- Day: 02, Part: 1 --------
# | Duration	| 3.65 ms	|
# | Allocated	| 15049		|
# | Result	| 9651	|
# ---------------------------------
