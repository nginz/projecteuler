class Triangle
  DELTA = 0.00001

  def initialize(coordinates)
    raise ArgumentError, "Too few coordinates" if coordinates.length < 6
    @vertices = []
    (0..5).step(2) do |i|
      # vertices: [[x1, y1], [x2, y2], [x3, y3]]
      @vertices << [coordinates[i], coordinates[i + 1]]
    end
  end

  def contains_origin?
    sub_areas = subarea(0, 1) + subarea(1, 2) + subarea(0, 2)
    (area - sub_areas).abs <= DELTA
  end

  def subarea(v0, v1)
    x0, y0 = @vertices[v0]
    x1, y1 = @vertices[v1]
    ((x0 * y1 - x1 * y0) / 2.0).abs
  end

  def area
    x0, y0 = @vertices[0]
    x1, y1 = @vertices[1]
    x2, y2 = @vertices[2]

    ((x0 * (y1 - y2) + x1 * (y2 - y0) + x2 * (y0 - y1)) / 2.0).abs
  end
end

tri_count = 0
File.foreach('triangles.txt').with_index do |line, line_num|
  puts tri_count
  tri_count += 1 if Triangle.new(line.split(/,/).map(&:to_i)).contains_origin?
end

puts tri_count #=> 228