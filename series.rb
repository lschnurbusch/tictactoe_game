require_relative 'player'

class Series

    attr_accessor :player1, :player2, :number_of_games

    def initialize

        puts "\nWho is the first player?"
        name1 = gets.chomp
        @player1 = Player.new(name1)

        puts "\nWho is the second player?"
        name2 = gets.chomp
        @player2 = Player.new(name2)

        puts "\nHow many games will you play?"
        @number_of_games = gets.chomp.to_i

    end

end