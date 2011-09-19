module NiceTextCaptcha
  
  class Captcha
   
    attr_reader :question
    attr_reader :answers
   
    NICE_TEXT_CAPTCHA_TYPE_DEFAULTS = [
      NiceTextCaptcha::Types::FixedQuestion,
      NiceTextCaptcha::Types::MathsQuestion,
      NiceTextCaptcha::Types::LetterPositionQuestion,
      NiceTextCaptcha::Types::WordsInListQuestion,
      NiceTextCaptcha::Types::WordLengthQuestion,
    ]
   
    def initialize
      captcha = (NICE_TEXT_CAPTCHA_TYPES rescue NICE_TEXT_CAPTCHA_TYPE_DEFAULTS).rand.new
      @question = captcha.question
      @answers = captcha.answers
    end
    
    def encrypted_answers_for(object_name)
      answers.collect { |answer| Captcha.hash(object_name, answer) }
    end

    def self.hash(obj, answer)
      begin
        secret = ActionController::Base.session_options[:secret]
      rescue Exception => e
        secret = Rails.application.config.secret_token
      end
      str = obj.to_s + answer.to_s + secret.to_s
      Digest::SHA2.hexdigest(str)
    end
    
  end
  
end