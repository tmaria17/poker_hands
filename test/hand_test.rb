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
end
