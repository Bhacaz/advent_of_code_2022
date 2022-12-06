class Part < BasePart
  def run
    index_found = 0
    chars = input.first.chars
    chars.each_with_index do |_, index|
      sequence = chars[index..index + 3]
      if sequence.uniq.size == sequence.size
        index_found = index + 4
        break
      end
    end
    index_found
  end
end

# -------- Day: 06, Part: 1 --------
# | Duration	| 0.73 ms	|
# | Allocated	| 10382		|
# | Result	| 1566	|
# ---------------------------------
