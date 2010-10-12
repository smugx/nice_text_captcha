class NiceTextCaptcha::Types::FixedQuestion < NiceTextCaptcha::Types::DefaultQuestion
  
  def initialize
    question = random_question
    @question = question.first
    @answers = question.last
  end

private
  
  def random_question
    [
      ["Is water wet or dry?", ["wet"]],
      ["Is snow hot or cold?", ["cold"]],
      ["Do dogs have tails?", ["yes", "y"]],
      ["How many noses have you got?", ["1", "one"]],
      ["Are elephants big or small?", ["big"]],
      ["How many legs has a cat got?", ["4", "four"]],
      ["Do shoes go on your hands or your feet?", ["feet", "your feet"]],
    ].rand
  end
    
end


