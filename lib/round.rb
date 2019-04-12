require_relative 'card'
require_relative 'hand'

class Round
  attr_reader :player_1, :player_2
  def initialize(card_array)
    @player_1 = Hand.new(card_array[0..4])
    @player_2 = Hand.new(card_array[5..9])
  end
end
