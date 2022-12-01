class Part < BasePart
  def run
    input.sort_by { |bag| bag.inject(:+) }.reverse[..2].flatten.sum
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

# -------- Day: 01, Part: 2 --------
# | Duration	| 2.44 ms	|
# | Allocated	| 4789		|
# | Result	| 205370	|
# ---------------------------------
