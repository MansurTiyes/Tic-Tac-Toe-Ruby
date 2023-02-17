#class that involves all operations involved with the game board
class Board
    def initialize
        @board = [
            ["","",""],
            ["","",""],
            ["","",""]
        ]
    end

    #method that takes a position selected by user(number 1-9) and converts it into corresponding board bosition on the 2d array
    def convert_input_to_poistion(input)
        case input
        when 1..3
            position = [0,input-1]
        when 4..6
            position = [1,input-4]
        when 7..9
            position = [2,input-7]
        end

        return position
    end

    #method that checks status of the game (won, lost or draw)
    def check_status(symbol)
        #checks for rows
        self.board.each_with_index do |value, index|
            if value.count(symbol)==3
                status = "WON"
                return status
            end
        end

        #checks for columns
        columns_array = [[],[],[]]
        columns_array.each_with_index do |value,index|
            self.board.each { |array| columns_array[index].push(array[index])}
            if columns_array[index].count(symbol)==3
                status = "WON"
                return status
            end
        end

        #check for diagonals
        diagonals_array = [[],[]]
        self.board.each_with_index do |array, index| 
            diagonals_array[0].push(array[index])
            next
        end
        self.board.reverse.each_with_index do |array, index|
            diagonals_array[1].push(array[index])
            next
        end
        diagonals_array.each_with_index do |value,index|
            if diagonals_array[index].count(symbol) == 3
                status = "WON"
                return status
            end
        end

        #check for draw
        flattened_array = self.board.flatten
        if !flattened_array.include?("")
            status = "DRAW"
            return status
        end
        
        return 'IN PROGRESS'
    end

    #method that changes board position to that specific symbol
    def board_update(position, symbol)
        self.board[position[0]][position[1]] = symbol
    end

    attr_accessor :board
end

