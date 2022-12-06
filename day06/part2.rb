class Part < BasePart
  def run
    index_found = 0
    chars = input.first.chars
    chars.each_with_index do |_, index|
      sequence = chars[index..index + 13]
      if sequence.uniq.size == sequence.size
        index_found = index + 14
        break
      end
    end
    index_found
  end
end

# -------- Day: 06, Part: 2 --------
# | Duration	| 2.09 ms	|
# | Allocated	| 13138		|
# | Result	| 2265	|
# ---------------------------------
