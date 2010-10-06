#config.gem "linguistics"
require 'linguistics'
Linguistics::use(:en)

require 'nice_text_captcha/captcha'

require 'nice_text_captcha/active_record_extensions'
require 'nice_text_captcha/action_controller_extensions'
require 'nice_text_captcha/form_builder_extensions'

require 'nice_text_captcha/types/default_question'
require 'nice_text_captcha/types/letter_position_question'
require 'nice_text_captcha/types/maths_question'
require 'nice_text_captcha/types/word_length_question'
require 'nice_text_captcha/types/words_in_list_question'

ActionView::Helpers::FormBuilder.send :include, NiceTextCaptcha::FormBuilderExtensions

ActiveRecord::Base.send :include, NiceTextCaptcha::ActiveRecordExtensions

ActionController::Base.send :include, NiceTextCaptcha::ActionControllerExtensions
