module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess: '
    end

    def guess(guess)
      mark = ''
      (0..3).each do |i|
        if guess[i] == @secret[i]
          mark.insert(0, '+')
          guess[i] = ' '
        elsif guess.include?(@secret[i])
          mark << '-'
        end
      end
      @output.puts mark
    end
  end
end
