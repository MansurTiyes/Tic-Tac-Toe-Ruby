#Class that defines player by its symbol (x or o)
class Player
    def initialize(symbol)
        @symbol = symbol
        @move = 0
        @won = false
    end

    attr_reader :symbol
    attr_accessor :move
    attr_accessor :won
end