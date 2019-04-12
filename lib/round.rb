require_relative 'card'
require_relative 'hand'

class Round
  attr_reader :player_1, :player_2
  def initialize(card_array)
    @player_1 = Hand.new(card_array[0..4])
    @player_2 = Hand.new(card_array[5..9])
  end

  def winning_hand
    if @player_1.royal_flush?
      @player_1
    elsif @player_2.royal_flush?
      @player_2
    elsif @player_1.straight_flush? && @player_2.straight_flush?
      tie
    elsif @player_1.straight_flush?
      @player_1
    elsif @player_2.straight_flush?
      @player_2
    elsif @player_1.four_of_a_kind? && @player_2.four_of_a_kind?
        tie
    elsif @player_1.four_of_a_kind?
        @player_1
    elsif @player_2.four_of_a_kind?
      @player_2
    elsif @player_1.full_house? && @player_2.full_house?
      tie
    elsif @player_1.full_house?
      @player_1
    elsif @player_2.full_house?
      @player_2
    elsif @player_1.flush? && @player_2.flush?
      tie
    elsif @player_1.flush?
      @player_1
    elsif @player_2.flush?
      @player_2
    elsif @player_1.straight? && @player_2.straight?
      tie
    elsif @player_1.straight?
      @player_1
    elsif @player_2.straight?
      @player_2
    elsif @player_1.three_of_a_kind? && @player_2.three_of_a_kind?
      tie
    elsif @player_1.three_of_a_kind?
      @player_1
    elsif @player_2.three_of_a_kind?
      @player_2
    elsif @player_1.two_pair? && @player_2.two_pair?
      tie
    elsif @player_1.two_pair?
      @player_1
    elsif @player_2.two_pair?
      @player_2
    elsif @player_1.one_pair && @player_2.one_pair
      one_pair_tie
    elsif @player_1.one_pair
      @player_1
    elsif @player_2.one_pair
      @player_2
    else
      tie
    end
  end

  def one_pair_tie
    if @player_1.one_pair > @player_2.one_pair
      @player_1
    elsif @player_2.one_pair > @player_1.one_pair
      @player_2
    else
      tie
    end
  end

  def tie
    if @player_1.high_card > @player_2.high_card
        @player_1
    elsif @player_2.high_card > @player_1.high_card
        @player_2
    elsif @player_1.high_card == @player_2.high_card
        @player_1.values.delete(@player_1.high_card)
        @player_2.values.delete(@player_2.high_card)
        tie_breaker_again
    end
  end

  def tie_breaker_again
    if @player_1.values.max > @player_2.values.max
      @player_1
    elsif @player_2.values.max > @player_1.values.max
      @player_2
    end
  end
end
