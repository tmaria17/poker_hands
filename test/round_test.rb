gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/round'
require 'pry'

class RoundTest < Minitest::Test
  def test_it_exists
    round = Round.new(["8C", "TS", "KC", "9H", "4S", "7D", "2S", "5D", "3S", "AC"])

    assert_instance_of Round, round
  end

  def test_it_has_two_players_that_hold_hand_objects
    round = Round.new(["8C", "TS", "KC", "9H", "4S", "7D", "2S", "5D", "3S", "AC"])
    assert_instance_of Hand, round.player_1
    assert_instance_of Hand, round.player_2
  end

  def test_it_returns_a_winner_even_if_there_is_a_tie
    round = Round.new(["1C", "2C", "3C", "4C", "5C", "6C", "5C", "4C", "3C", "2C"])
    assert_equal round.player_2, round.winning_hand
  end
end
