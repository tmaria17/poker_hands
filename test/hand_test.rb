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

  def test_it_holds_a_card_array
    hand = Hand.new(["5H", "5C", "6S", "7S", "KD"])
    assert_equal ["5H", "5C", "6S", "7S", "KD"], hand.card_array
  end

  def test_it_has_cards_with_card_attributes
    hand = Hand.new(["5H", "5C", "6S", "7S", "KD"])
    assert_equal "5", hand.cards.first.value
    assert_equal "H", hand.cards.first.suit
  end
end
