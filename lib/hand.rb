require_relative 'card'
require 'pry'

class Hand
  def initialize(card_array)
    @card_array = card_array
  end

  def royal_flush?
    flush? && values.sort == ["10","11","12","13","14"]
  end

  def royal?
    face_values.all? do |f_value|
      values.include?(f_value)
    end
  end

  def straight_flush?
    straight? && flush?
  end

  def full_house?
    three_of_a_kind? && one_pair
  end

  def flush?
    suites.uniq.length == 1
  end

  def straight?
    values_int = values.map do |v|
                  v.to_i
                end
    values_int.sort.each_cons(2).all? do |first_card, next_card|
       next_card == first_card + 1
    end
  end

  def four_of_a_kind?
    values.any? { |value| values.count(value) == 4 }
  end

  def three_of_a_kind?
    values.any? { |value| values.count(value) == 3 }
  end

  def two_pair?
    frequency =
    values.inject(Hash.new(0)) do|h,v|
        h[v] += 1; h
    end
    frequency.values.count(2) == 2
  end

  def one_pair
    frequency =
    values.inject(Hash.new(0)) do|h,v|
        h[v] += 1; h
    end
    if frequency.values.count(2) == 1
      return frequency.key(2).to_i
    end
  end

  def high_card
    values_to_i = [ ]
    values.each do |value|
      values_to_i.push(value.to_i)
    end
    values_to_i.max
  end

  def face_values
    ["T","J", "Q", "K", "A"]
  end

  def face_value_conversion
    {
      "T": "10",
      "J": "11",
      "Q": "12",
      "K": "13",
      "A": "14"
    }
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
      if face_values.include?(card.value)
        value_array.push(face_value_conversion[card.value.to_sym])
      else
      value_array.push(card.value)
      end
    end
    return value_array
  end

  def cards
    @card_array.map do |card_data|
      Card.new(card_data)
    end
  end
end
