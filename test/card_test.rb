gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require 'pry'

class CardTest < Minitest::Test
  def test_it_exists
    card = Card.new("4D")
    assert_instance_of Card, card
  end

  def test_it_has_a_value
    card = Card.new("4D")
    assert_equal card.value, "4"
  end

  def test_it_has_a_suit
    card = Card.new("4D")
    assert_equal card.suit, "D"
  end
end
