require_relative 'Player.rb'

class Game
    def printer()
        player1 = Player.new("x")
        puts player1.won
    end
end

game = Game.new
game.printer