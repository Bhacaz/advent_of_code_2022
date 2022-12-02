class Game
  ROCK = :rock
  PAPER = :paper
  SCISSORS = :scissors
  TOOLS = [ROCK, PAPER, SCISSORS].freeze

  def initialize(opponent, me)
    @opponent = tool(opponent)
    @me = select_tool_for_me(me)
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

  def select_tool_for_me(should_win)
    case should_win
    when 'X'
      TOOLS.detect do |tool|
        @me = tool
        win? == false
      end
    when 'Y'
      TOOLS.detect do |tool|
        @me = tool
        win?.nil?
      end
    when 'Z'
      TOOLS.detect do |tool|
        @me = tool
        win? == true
      end
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

# -------- Day: 02, Part: 2 --------
# | Duration	| 4.79 ms	|
# | Allocated	| 22556		|
# | Result	| 10560	|
# ---------------------------------
