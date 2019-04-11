class Card
  def initialize(card_data)
    @value = card_data.chars[0]
    @suit = card_data.chars[1]
  end
end
