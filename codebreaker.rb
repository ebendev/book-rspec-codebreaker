module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret=nil)
      @secret = secret || ''

      4.times { @secret << (1..6).to_a.sample.to_s } unless @secret.length == 4

      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess: '
    end

    def guess(guess)
      mark = []

      secret, guess = *@secret.to_a.zip(guess.to_a).reject {|s, g| mark >> '+' if s == g }.transpose || [], []
      secret.each {|c| mark << '-' if guess.delete_first c }

      mark.join
    end

    def secret
      @secret
    end
  end
end

class Array
  def >>(o)
    self.unshift o
  end

  def delete_first(o)
    self.delete_at(self.index(o)) if self.index(o)
  end
end

class String
  def to_a
    self.split ''
  end
end