class Part < BasePart
  def run
    count = 0
    input.each do |e11, e12, e21, e22|
      intersection = (e11..e12).to_a & (e21..e22).to_a
      if intersection.any?
        count += 1
      end
    end
    count
  end

  REGEX = /(\d+)-(\d+),(\d+)-(\d+)/
  def input_parser(input)
    input.map do |line|
      line.scan(REGEX).first.map(&:to_i)
    end
  end
end

# -------- Day: 04, Part: 2 --------
# | Duration	| 241.35 ms	|
# | Allocated	| 29672		|
# | Result	| 825	|
# ---------------------------------
