require_relative 'Player.rb'
require_relative 'Board.rb'

module Display
    #Method that displays starting menu
    def display_menu
        puts "\t\tWelcome to Game of Tic-Tac-Toe!"
        puts "======================================="
        puts "\tPress 1 to play the Game!"
    end

    #method that displays whose turn is it at the moment
    def display_which_move(symbol)
        if symbol=="x"
            puts "Player 1 turn! Select a tile to put your X in!"
        else    
            puts "Player 2 turn! Select a tile to put your O in!"
        end
    end

    #method that displays board's current state
    def display_board(board_array)
        board_array.each_with_index do |value, index| 
            puts "\t\t#{board_array[index][0]} || #{board_array[index][1]} || #{board_array[index][2]}"
            if index!=2
                puts "\t\t==========="
            end
        end
    end

    #Method that displays who won
end


class Game
    include Display
    def initialize
        @board = [
            ["x","o","x"],
            ["x","","o"],
            ["o","x",""]
        ]
    end
    def game
        display_board(@board)
    end
end

new_g = Game.new
new_g.game

