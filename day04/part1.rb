class Part < BasePart
  def run
    count = 0
    input.each do |e11, e12, e21, e22|
      range1 = e11..e12
      range2 = e21..e22
      intersection = range1.to_a & range2.to_a
      if intersection.size == range1.size || intersection.size == range2.size
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

# -------- Day: 04, Part: 1 --------
# | Duration	| 4.39 ms	|
# | Allocated	| 18915		|
# | Result	| 475	|
# ---------------------------------
