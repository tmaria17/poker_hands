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

  def test_it_can_find_one_pair
    hand = Hand.new(["5H", "5H", "6S", "7S", "KD"])
    hand_2 = Hand.new(["5H", "5H", "5S", "7S", "KD"])

    assert hand.one_pair?
    refute hand_2.one_pair?
  end

  def test_it_can_find_two_pairs
    hand = Hand.new(["5H", "5H", "6S", "KS", "KD"])
    hand_2 = Hand.new(["5H", "5H", "KS", "KS", "KD"])

    assert hand.two_pair?
    refute hand_2.two_pair?
  end

  def test_it_can_find_three_of_a_kind
    hand = Hand.new(["5H", "5H", "5S", "7S", "KD"])
    hand_2 = Hand.new(["5H", "5H", "4S", "7S", "KD"])

    assert hand.three_of_a_kind?
    refute hand_2.three_of_a_kind?
  end

  def test_it_can_find_four_of_a_kind
    hand = Hand.new(["5H", "5H", "5S", "5S", "KD"])
    hand_2 = Hand.new(["5H", "5H", "4S", "7S", "KD"])

    assert hand.four_of_a_kind?
    refute hand_2.four_of_a_kind?
  end
end
