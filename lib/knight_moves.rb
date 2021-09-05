class Spot
  attr_reader :data, :parent

  def initialize(spot, parent=nil)
    @data = spot
    @parent = parent
  end

  def adjacents
    [
      Spot.new([data[0] + 1, data[1] + 2], self),
      Spot.new([data[0] + 2, data[1] + 1], self),
      Spot.new([data[0] + 2, data[1] - 1], self),
      Spot.new([data[0] + 1, data[1] - 2], self),
      Spot.new([data[0] - 1, data[1] - 2], self),
      Spot.new([data[0] - 2, data[1] - 1], self),
      Spot.new([data[0] - 2, data[1] + 1], self),
      Spot.new([data[0] - 1, data[1] + 2], self)
    ].select { |spot| spot.valid? }
  end

  def size
    data.size
  end

  def valid?
    return false unless size == 2
    data.all? { |co| (0..7).cover?(co) }
  end

  def ==(other)
    data == other.data
  end

  def find_path(queue, end_point)
    if queue.include? end_point
      return queue.select { |e| e == end_point }.first
    end

    new_queue = []
    queue.each do |spot|
      spot.adjacents.each { |co| new_queue << co }
    end
    find_path(new_queue, end_point)
  end

  def traverse(end_point)
    queue = adjacents
    return [data, end_point.data] if queue.include? end_point

    found_point = find_path(queue, end_point)
    path = []
    loop do
      path.unshift(found_point)
      break if found_point == self
      found_point = found_point.parent
    end
    path.map { |spot| spot.data }
  end
end

def knight_moves(start, finish)
  moves = [start]
  return moves if start == finish

  Spot.new(start).traverse(Spot.new(finish))
end

p knight_moves([0,0], [7,7])
