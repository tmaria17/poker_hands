require_relative 'round'
require_relative 'card'
require_relative 'hand'

class Game
  attr_reader :player_1_score, :player_2_score
  def initialize
    @player_1_score = 0
    @player_2_score = 0
  end

  def play_poker(file)
    File.open(file).each do |line|
      cards = line.chomp.split(" ")
      round = Round.new(cards)
      if round.winning_hand == round.player_1
         puts "Player 1 wins! "
        @player_1_score += 1
      elsif round.winning_hand == round.player_2
         puts "Player 2 wins! "
        @player_2_score += 1
      end
    end
    puts "Player one won #{@player_1_score} hands."
    puts "Player two won #{@player_2_score} hands."
  end
end
