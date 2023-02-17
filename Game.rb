require_relative 'Player.rb'
require_relative 'Board.rb'

module Display
    #Method that displays starting menu
    def display_menu
        puts "\t\tWelcome to Game of Tic-Tac-Toe!"
        puts "\t================================================="
        puts "\t\tPress 1 to play the Game!"
    end

    #method that displays instructions
    def display_instructions
        puts "To select a tile where to place your symbol type in the corresponding grid number from table below:"
        puts "\t\t1 || 2 || 3"
        puts "\t========================"
        puts "\t\t4 || 5 || 6"
        puts "\t========================"
        puts "\t\t7 || 8 || 9"
        puts "\t========================"
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
    def winning_message(symbol)
        puts "\n\t\t#{symbol} WON!"
    end

    #Method that displays draw message
    def draw_message
        puts "\n\t\tIT'S DRAW!"
    end

end


class Game
    include Display
    def initialize
        @player1 = Player.new("x")
        @player2 = Player.new("o")
        @game_board = Board.new
    end
    
    def game
        current_player = @player1
        display_menu()
        if gets.chomp == "1"
            display_instructions() 
        else  
            puts "\t\tPlease enter existing option"
            return "end"
        end
        while game_board.check_status(current_player.symbol)=="IN PROGRESS" 
            display_which_move(current_player.symbol)
            move_made = gets.chomp.to_i
            if move_made<1 || move_made >9 
                puts "\t\tPlease enter existing option!"
            else
                current_player.move = move_made
                game_board.board_update(game_board.convert_input_to_poistion(current_player.move),current_player.symbol)
                display_board(game_board.board)
                if game_board.check_status(current_player.symbol)=="WON"
                    winning_message(current_player.symbol)
                elsif game_board.check_status(current_player.symbol)=="DRAW"
                    draw_message()
                else
                    if current_player == @player1
                        current_player = @player2
                    else
                        current_player = @player1
                    end
                end
            end
        end
        
    end

    protected
    attr_accessor :player1, :player2, :game_board, :current_player
end

new_g = Game.new
new_g.game

