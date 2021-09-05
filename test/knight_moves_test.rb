# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/knight_moves'

class KnightMovesTest < MiniTest::Test
  def test_valid
    assert Spot.new([0, 0]).valid?
    assert Spot.new([0, 7]).valid?
    assert Spot.new([7, 0]).valid?
    assert Spot.new([4, 3]).valid?
    refute Spot.new([-1, 0]).valid?
    refute Spot.new([8, 0]).valid?
    refute Spot.new([3, -4]).valid?
  end

  def test_adjacents
    expected = [
      [4, 5], [5, 4], [5, 2], [4, 1], [2, 1], [1, 2], [1, 4], [2, 5]
    ].map { |arr| Spot.new(arr) }
    assert_equal expected, Spot.new([3, 3]).adjacents

    expected = [[1, 2], [2, 1]].map { |arr| Spot.new(arr) }
    assert_equal expected, Spot.new([0, 0]).adjacents

    expected = [[7, 3], [4, 0], [4, 2], [5, 3]].map { |arr| Spot.new(arr) }
    assert_equal expected, Spot.new([6, 1]).adjacents
  end

  def test_short_moves
    expected = [[0, 0], [1, 2]]
    assert_equal expected, knight_moves([0,0], [1,2])

    expected = [[5, 6], [3, 5]]
    assert_equal expected, knight_moves([5, 6], [3, 5])

    expected = [[2, 3]]
    assert_equal expected, knight_moves([2, 3], [2, 3])
  end

  def test_longer_moves
    skip

    expected = [[0,0],[1,2],[3,3]]
    assert_equal expected, knight_moves([0,0],[3,3])

    expected = [[3,3],[1,2],[0,0]]
    assert_equal expected, knight_moves([3,3],[0,0])
  end
end
