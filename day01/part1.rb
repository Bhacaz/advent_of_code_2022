class Part < BasePart
  def run
    input.max_by { |bag| bag.inject(:+) }.sum
  end

  def input_parser(input)
    bag = []
    elf_bag = []
    input.each do |calorie|
      if calorie == ""
        bag << elf_bag
        elf_bag = []
      else
        elf_bag << calorie.to_i
      end
    end
    bag << elf_bag
    bag
  end
end

# -------- Day: 01, Part: 1 --------
# | Duration	| 2.3 ms	|
# | Allocated	| 4784		|
# | Result	| 68802	|
# ---------------------------------
