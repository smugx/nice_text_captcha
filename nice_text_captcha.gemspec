# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nice_text_captcha}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Neil Smith"]
  s.date = %q{2010-10-06}
  s.email = %q{neil.jx.smith@gmail.com}
  s.extra_rdoc_files = ["README"]
  s.files = ["README", "lib/nice_text_captcha", "lib/nice_text_captcha/action_controller_extensions.rb", "lib/nice_text_captcha/active_record_extensions.rb", "lib/nice_text_captcha/captcha.rb", "lib/nice_text_captcha/form_builder_extensions.rb", "lib/nice_text_captcha/types", "lib/nice_text_captcha/types/default_question.rb", "lib/nice_text_captcha/types/letter_position_question.rb", "lib/nice_text_captcha/types/maths_question.rb", "lib/nice_text_captcha/types/word_length_question.rb", "lib/nice_text_captcha/types/words_in_list_question.rb", "lib/nice_text_captcha.rb"]
  s.rdoc_options = ["--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Generates Text Catpchas, that are 'nice' by my own personal definition!}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
