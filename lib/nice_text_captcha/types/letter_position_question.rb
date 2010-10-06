class NiceTextCaptcha::Types::LetterPositionQuestion < NiceTextCaptcha::Types::DefaultQuestion
  
  def initialize
    word = [ANIMALS + COLOURS].flatten.rand
    position = rand(word.length) + 1
    answer = word[position - 1, 1]
    
    position_string = number_to_ordinal(position)
    
    position_string = "first" if position == 1 and fifty_fifty?
    position_string = "second" if position == 2 and fifty_fifty?
    position_string = (fifty_fifty? ? "final" : "last") if position == word.length and fifty_fifty?
    position_string = "second to last" if position == word.length - 1 and fifty_fifty?
    
    @question = format_question(randomly_quote_and_capitalise(word), position_string)
    @answers = [answer]
  end
  
  def format_question(word, position)
    [
      "What is the %s letter in the word %s?" % [position, word],
      "What's the %s letter in the word %s?" % [position, word],
      "The %s letter in %s is what?" % [position, word],
      "The %s letter in the word %s is?" % [position, word],
      "In the word %s, what is the %s letter?" % [word, position],
      "In the word %s, what is the letter in the %s position?" % [word, position],
    ].rand
  end
  
private
  
end