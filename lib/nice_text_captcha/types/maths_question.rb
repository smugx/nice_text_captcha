class NiceTextCaptcha::Types::MathsQuestion < NiceTextCaptcha::Types::DefaultQuestion
  
  def initialize
    number_1 = one_to_nine
    number_2 = one_to_nine
    answer = number_1 + number_2
    
    @question = format_question(number_or_word(number_1), number_or_word(number_2))
    @answers = [answer, number_to_word(answer)]
  end
  
  def format_question(one, two)
    [
      "What is %s plus %s?" % [one, two],
      "What is %s + %s?" % [one, two],
      "What is %s added to %s?" % [one, two],
      "What do you get if you add the numbers %s and %s?" % [one, two],
      "What is the result of adding %s and %s?" % [one, two],
    ].rand
  end
  
private

  def one_to_nine
    rand(9) + 1
  end
  
  def number_or_word(number)
    if fifty_fifty?
      number
    else
      randomly_quote_and_capitalise(number_to_word(number))
    end
  end
    
end