gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/hand'
require 'pry'

class HandTest < Minitest::Test
  def test_it_exists
    hand = Hand.new(["5H", "5C", "6S", "7S", "KD"])

    assert_instance_of Hand, hand
  end

  def test_it_holds_cards_with_card_attributes
    hand = Hand.new(["5H", "5H", "6S", "7S", "KD"])

    assert_equal "5", hand.cards.first.value
    assert_equal "H", hand.cards.first.suit
  end

  def test_it_has_values
    hand = Hand.new(["5H", "5H", "6S", "7S", "KD"])

    assert_equal ["5", "5", "6", "7", "K"], hand.values
  end

  def test_it_has_suits
    hand = Hand.new(["5H", "5H", "6S", "7S", "KD"])

    assert_equal ["H", "H", "S", "S", "D"], hand.suites
  end

  def test_if_a_hand_has_one_pair
    hand = Hand.new(["5H", "5H", "6S", "7S", "KD"])
    assert_equal true, hand.one_pair?
  end

  def test_it_does_not_count_two_pair_as_one
    hand = Hand.new(["5H", "5H", "5S", "7S", "KD"])
    assert_equal false, hand.one_pair?
  end

  def test_it_can_find_two_pairs
    hand = Hand.new(["5H", "5H", "5S", "7S", "KD"])
    assert_equal true, hand.two_pair?
  end
end
