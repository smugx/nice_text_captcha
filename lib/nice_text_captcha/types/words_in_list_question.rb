class NiceTextCaptcha::Types::WordsInListQuestion < NiceTextCaptcha::Types::DefaultQuestion
  
  def initialize
    animals = randomly_sort(ANIMALS)
    colours = randomly_sort(COLOURS)
    
    answer = rand(3) + 1
    
    if fifty_fifty?
      words = animals[0 .. answer-1]
      words << colours[0 .. rand(3)]
      noun = "animals"
    else
      words = colours[0 .. answer-1]
      words << animals[0 .. rand(3)]
      noun = "colours"
    end

    words.flatten!
    words.collect! { |w| randomly_quote_and_capitalise(w) }
    
    @question = format_question(noun, randomly_sort(words))
    
    @answers = [answer, number_to_word(answer)]
  end
  
  def format_question(noun, word_list)
    collective_noun = ["list", "words", "list of words", "word list"].rand
    collective_noun = "following " + collective_noun if fifty_fifty?

    [
      "How many %s are in the %s: %s?" % [noun, collective_noun, word_list.to_sentence],
      "How many %s are there in the %s: %s?" % [noun, collective_noun, word_list.to_sentence],
      "In the %s: %s - how many %s are there?" % [collective_noun, word_list.to_sentence, noun],
    ].rand
  end
      
end