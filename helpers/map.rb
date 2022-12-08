class Map
  def initialize(rows)
    @map2d = rows
  end

  def at(x, y)
    @map2d[y][x]
  end

  def in_column(x)
    @map2d.map { |row| row[x] }
  end

  def in_row(y)
    @map2d[y]
  end

  def width
    @map2d.first.size
  end

  def height
    @map2d.size
  end

  def each
    @map2d.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        yield cell, x, y
      end
    end
  end

  def left_of(x, y)
    x == 0 ? nil : at(x - 1, y)
  end

  def all_left_of(x, y)
    (0...x).map { |i| at(i, y) }.reverse
  end

  def right_of(x, y)
    x == width - 1 ? nil : at(x + 1, y)
  end

  def all_right_of(x, y)
    ((x + 1)...width).map { |i| at(i, y) }
  end

  def top_of(x, y)
    y == 0 ? nil : at(x, y - 1)
  end

  def all_top_of(x, y)
    (0...y).map { |i| at(x, i) }.reverse
  end

  def bottom_of(x, y)
    y == height - 1 ? nil : at(x, y + 1)
  end

  def all_bottom_of(x, y)
    ((y + 1)...height).map { |i| at(x, i) }
  end

  def to_s
    @map2d.map(&:join).join("\n")
  end
end
