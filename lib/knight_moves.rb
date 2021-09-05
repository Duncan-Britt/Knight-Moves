class Spot
  attr_reader :data

  def initialize(spot)
    @data = spot
  end

  def adjacents
    [
      Spot.new([data[0] + 1, data[1] + 2]),
      Spot.new([data[0] + 2, data[1] + 1]),
      Spot.new([data[0] + 2, data[1] - 1]),
      Spot.new([data[0] + 1, data[1] - 2]),
      Spot.new([data[0] - 1, data[1] - 2]),
      Spot.new([data[0] - 2, data[1] - 1]),
      Spot.new([data[0] - 2, data[1] + 1]),
      Spot.new([data[0] - 1, data[1] + 2])
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
end

def knight_moves(start, finish)
  moves = [start]
  return moves if start == finish

  spot = Spot.new(start)
  queue = spot.adjacents
  return moves << finish if queue.include? Spot.new(finish)

  # arr = []
  # queue.each do |spot|
  #   adjacent_spots(spot).each { |co| arr << co }
  # end

  # if arr.include? finish
end

# def each_level_order
#   queue = [root]
#   until queue.include? Spot.new(finish) # THE CONDITION
#     node = queue.shift
#     yield(node) if block_given?
#     if node.one_child?
#       queue << node.child
#     elsif !node.leaf?
#       node.children.each { |e| queue << e }
#     end
#   end
# end
