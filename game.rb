require_relative 'series'
require_relative 'positions'

class Game

    attr_accessor :players, :available_positions, :winner

    def initialize(series, index)

        @players = {:x => nil, :o => nil}
        if index.odd?
            @players[:x] = series.player1
            @players[:o] = series.player2
        else
            @players[:x] = series.player2
            @players[:o] = series.player1
        end

        @players.each do |xo, player|
            player.positions.clear
        end

        @board = {}.merge(Positions::POSITIONS)

        @winner = nil

    end

    def to_win(player)
        
        @winner = player
        puts "\n#{player.name} wins!"
        player.wins += 1

    end

    def take_turn(player)

        puts "\n\n#{player.name}'s turn!"

        puts "\nYou currently hold the following positions:"
        held_positions = @board.select {|n, value| @board[n] == player.name}
        puts held_positions.keys

        puts "\nThe following positions are available:"
        available_positions = @board.select {|n, value| @board[n] == nil}
        puts available_positions.keys

        puts "\nWhich position do you select?"
        selection = gets.chomp.to_i

        if @board[selection] != nil
            puts "\nYou must choose another position. That one's taken!"
            take_turn(player)
        else
        @board[selection] = player.name
        end

        display_board

        if @board[1] == player.name && @board[2] == player.name && @board[3] == player.name
            to_win(player)
        elsif @board[4] == player.name && @board[5] == player.name && @board[6] == player.name
            to_win(player)
        elsif @board[7] == player.name && @board[8] == player.name && @board[9] == player.name
            to_win(player)
        elsif @board[1] == player.name && @board[4] == player.name && @board[7] == player.name
            to_win(player)
        elsif @board[2] == player.name && @board[5] == player.name && @board[8] == player.name
            to_win(player)
        elsif @board[3] == player.name && @board[6] == player.name && @board[9] == player.name
            to_win(player)
        elsif @board[1] == player.name && @board[5] == player.name && @board[9] == player.name
            to_win(player)
        elsif @board[3] == player.name && @board[5] == player.name && @board[7] == player.name
            to_win(player)
        end

    end

    def play(index)

        puts "\n\n\n\nGame #{index}!"

        loop do 

            if !@board.values.include?(nil) && @winner == nil
                puts "\nIt's a scratch!"
                break
            end

            take_turn(@players[:x])
            if @winner == @players[:x]
                break
            end

            if !@board.values.include?(nil) && @winner == nil
                puts "\nIt's a scratch!"
                break
            end

            take_turn(@players[:o])
            if @winner == @players[:o]
                break
            end

        end
        
    end

    def what_to_print(value)
        
        if value == nil
            " "
        elsif value == @players[:x].name
            "X"
        else
            "O"
        end

    end

    def display_board

        puts "\n\n"
        puts "#{what_to_print(@board[1])} #{what_to_print(@board[2])} #{what_to_print(@board[3])}\n#{what_to_print(@board[4])} #{what_to_print(@board[5])} #{what_to_print(@board[6])}\n#{what_to_print(@board[7])} #{what_to_print(@board[8])} #{what_to_print(@board[9])}"

    end

end