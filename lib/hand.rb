require_relative 'card'
require 'pry'
class Hand
  def initialize(card_array)
    @card_array = card_array
  end

  def three_of_a_kind?
    values.any? { |value| values.count(value) == 3 }
  end

  # def two_pair?
  #   values.any? { |value| values.count(value) == 3 }
  # end

  def one_pair?
    values.any? { |value| values.count(value) == 2 }
  end

  def suites
    suit_array = [ ]
    cards.each do |card|
      suit_array.push(card.suit)
    end
    return suit_array
  end

  def values
    value_array = [ ]
    cards.each do |card|
      value_array.push(card.value)
    end
    return value_array
  end

  def cards
    @card_array.map do |card_data|
      Card.new(card_data)
    end
  end
end
