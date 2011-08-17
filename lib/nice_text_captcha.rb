require 'linguistics'
Linguistics::use(:en)

require 'nice_text_captcha/array'

require 'nice_text_captcha/types/default_question'
require 'nice_text_captcha/types/fixed_question'
require 'nice_text_captcha/types/letter_position_question'
require 'nice_text_captcha/types/maths_question'
require 'nice_text_captcha/types/word_length_question'
require 'nice_text_captcha/types/words_in_list_question'

require 'nice_text_captcha/captcha'

require 'nice_text_captcha/active_record_extensions'
require 'nice_text_captcha/action_controller_extensions'
require 'nice_text_captcha/form_builder_extensions'


# Mix in form builder helper
ActionView::Helpers::FormBuilder.send :include, NiceTextCaptcha::FormBuilderExtensions

# Mix in validation
ActiveRecord::Base.send :include, NiceTextCaptcha::ActiveRecordExtensions

# Mix in controller-controlled validation
ActionController::Base.send :include, NiceTextCaptcha::ActionControllerExtensions
