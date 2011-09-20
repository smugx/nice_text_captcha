module NiceTextCaptcha
  
  module FormBuilderExtensions
    
    def nice_text_captcha(options = {})
      captcha = NiceTextCaptcha::Captcha.new
      @template.flash[:nice_text_captcha_responses] = captcha.encrypted_answers_for(@object_name)
      
      if options[:exclude_label] and options[:exclude_label] == true
        captcha.question
      else
        label :nice_text_captcha, captcha.question
      end
    end
    
  end
  
end
