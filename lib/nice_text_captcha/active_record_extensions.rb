module NiceTextCaptcha
  
  module ActiveRecordExtensions
    
    attr_accessor :nice_text_captcha
    attr_accessor :nice_text_captcha_responses
    
    def check_nice_text_captcha
      
      captcha_successful = @nice_text_captcha_responses.nil?
      @nice_text_captcha_responses.each do |response|
        captcha_successful = true if Captcha.hash(self.class.to_s.underscore, @nice_text_captcha.strip.downcase) == response
      end if @nice_text_captcha_responses
      
      if !captcha_successful && !Rails.env.test?
        errors.add_to_base(nice_text_captcha_failure_message)
      end
        
    end
    
protected

    def nice_text_captcha_failure_message
      "Please ensure you answer the security question (CAPTCHA) correctly"
    end
    
  end
  
end
