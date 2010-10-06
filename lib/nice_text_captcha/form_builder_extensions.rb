module NiceTextCaptcha
  
  module FormBuilderExtensions
    
    def nice_text_captcha
      captcha = NiceTextCaptcha::Captcha.new
      @template.flash[:nice_text_captcha_responses] = captcha.encrypted_answers_for(@object_name)
      label :nice_text_captcha, captcha.question
    end
    
  end
  
end
