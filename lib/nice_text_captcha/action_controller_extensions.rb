module NiceTextCaptcha
  
  module ActionControllerExtensions
    
    def validate_nice_text_captcha_for(obj)
      obj.nice_text_captcha_responses = flash[:nice_text_captcha_responses] || ["no_answers_in_session"]
    end
    
  end
  
end
