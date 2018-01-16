class Game
attr_accessor :correct_count

  def initialize
    @correct_count = 0
  end
  
  def over?
    Dictionary.count == Question.used_words.count
  end
  
  def play(hash)
    while !over?
      question = Question.new
      question.build_question(hash)
      input = gets.strip
      self.correct_count += 1 if question.correct?
    end
  end
      
end

Game.new.play()