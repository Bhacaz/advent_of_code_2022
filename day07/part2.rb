class ElfFile
  attr_accessor :name, :size
  def initialize(name, size)
    @name = name
    @size = size
  end
end

class ElfDir
  attr_accessor :name, :contains, :parent_dir
  def initialize(name, parent_dir)
    @name = name
    @contains = []
    @parent_dir = parent_dir
  end

  def size
    @contains.sum(&:size)
  end
end

class Part < BasePart
  def run
    root = ElfDir.new('/', nil)
    @dirs = [root]
    @current_dir = root

    input.each do |line|
      if command?(line) && line.include?('$ ls')
        next
      elsif command?(line) && line.start_with?('$ cd ')
        if line.include?(' ..')
          @current_dir = @current_dir.parent_dir
        else
          move_dir = ElfDir.new(line[5..-1], @current_dir)
          @current_dir.contains << move_dir
          @dirs << move_dir
          @current_dir = move_dir
        end
      else
        ls(line)
      end
    end

    total = 70000000
    current = @dirs.first.size
    need = 30000000
    min_to_delete = 70000000

    @dirs.each do |d|
      to_delete = d.size
      freespace = total - current + to_delete
      if freespace > 0 && freespace >= need
        min_to_delete = [min_to_delete, to_delete].min
      end
    end
    min_to_delete
  end

  def ls(line)
    if dir?(line)
    else
      size, name = line.split(' ')
      @current_dir.contains << ElfFile.new(name, size.to_i)
    end
  end

  def dir?(line)
    line.start_with?('dir ')
  end

  def command?(line)
    line.start_with?('$ ')
  end
end

# -------- Day: 07, Part: 2 --------
# | Duration	| 0.76 ms	|
# | Allocated	| 6301		|
# | Result	| 5649896	|
# ---------------------------------
