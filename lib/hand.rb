require_relative 'card'
class Hand
  attr_reader :card_array, :cards
  def initialize(card_array)
    @card_array = card_array
  end
  
  def cards
    @card_array.map do |card_data|
      Card.new(card_data)
    end
  end
end
