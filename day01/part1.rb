class Part < BasePart
  def run

  end

  def input_parser(input)
    input.map(&:to_i)
  end
end
