gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'
require 'pry'

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_scores_that_start_at_0
    game = Game.new
    assert_equal 0, game.player_1_score
    assert_equal 0, game.player_1_score
  end

  def test_it_can_read_file
    game = Game.new
    game.play_poker("/Users/maria.torres/turing/5module/take_home_challenges/poker_hands/data/poker.txt")
    assert_equal 376, game.player_1_score
    assert_equal 624, game.player_2_score
  end
end
