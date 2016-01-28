class RockPaperScissors
  #valid moves
  @@moves = ["R","P","S"]
  
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    #check if any of the players have invalid move
    if !@@moves.include?(player1[1]) || !@@moves.include?(player2[1])
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
    
    #when they have the same moves
    if player1[1] == player2[1]
      return player1
    end
    
    case player1[1] 
      when "R"
        if player2[1] == "P"
          return player2
        else return player1
        end
      when "P"
        if player2[1] == "R"
          return player1
        else return player2
        end
      else
        if player2[1] == "R"
          return player2
        else return player1
        end
    end
  end

  def self.tournament_winner(tournament)
    #base case: when there is only one player
    if tournament[0].is_a?(String) && tournament[1].is_a?(String)
      return tournament
    end
    
    return winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
  end

end
