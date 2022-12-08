require_relative '../helpers/map'

class Part < BasePart
  def run
    @map = Map.new(input)

    scenic_scores = []
    @map.each do |cell, x, y|
      next if x == 0 || y == 0 || x == @map.width - 1 || y == @map.height - 1

      scenic_scores << visible_tree(cell, x, y)
    end

    scenic_scores.max
  end

  def visible_tree(cell, x, y)
    scenic_score = []
    scenic_score << count_trees(cell, @map.all_top_of(x, y))
    scenic_score << count_trees(cell, @map.all_bottom_of(x, y))
    scenic_score << count_trees(cell, @map.all_left_of(x, y))
    scenic_score << count_trees(cell, @map.all_right_of(x, y))
    scenic_score.reduce(&:*)
  end

  def count_trees(cell, trees_to_check)
    count = 0
    trees_to_check.each do |tree|
      count += 1
      break if tree >= cell
    end
    count
  end

  def input_parser(input)
    input.map do |line|
      line.chars.map(&:to_i)
    end
  end
end

# -------- Day: 08, Part: 2 --------
# | Duration	| 164.7 ms	|
# | Allocated	| 206219		|
# | Result	| 209880	|
# ---------------------------------
