require_relative 'series'
require_relative 'game'

puts "\n\n\nLet's play Tic-Tac-Toe!"

series = Series.new

1.upto(series.number_of_games) do |n|
    game = Game.new(series, n)
    game.play(n)
end

puts "\n\n\nResults:"
puts "\n#{series.player1.name}'s wins: #{series.player1.wins}"
puts "\n#{series.player2.name}'s wins: #{series.player2.wins}"
puts "\nScratches: #{series.number_of_games - series.player1.wins - series.player2.wins}"

if series.player1.wins > series.player2.wins
    puts "\n\n#{series.player1.name} won the match!"
elsif series.player2.wins > series.player1.wins
    puts "\n\n#{series.player2.name} won the match!"
else
    puts "\n\nIt was a tie!"
end

puts "\n"