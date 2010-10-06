class NiceTextCaptcha::Types::WordLengthQuestion < NiceTextCaptcha::Types::DefaultQuestion
  
  def initialize
    word = [ANIMALS + COLOURS].flatten.rand
    answer = word.length
    
    @question = format_question(randomly_quote_and_capitalise(word))
    @answers = [answer, number_to_word(answer)]
  end
  
  def format_question(word)
    [
      "How many letters are in the word %s?" % word,
      "How many letters are there in the word %s?" % word,
      "How many letters are there in %s?" % word,
      "In the word %s, how many letters are there?" % word,
    ].rand
  end
    
end