# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nice_text_captcha}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Neil Smith"]
  s.date = %q{2011-08-17}
  s.email = %q{neil.jx.smith@gmail.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown", "lib/nice_text_captcha/action_controller_extensions.rb", "lib/nice_text_captcha/active_record_extensions.rb", "lib/nice_text_captcha/captcha.rb", "lib/nice_text_captcha/form_builder_extensions.rb", "lib/nice_text_captcha/types/default_question.rb", "lib/nice_text_captcha/types/fixed_question.rb", "lib/nice_text_captcha/types/letter_position_question.rb", "lib/nice_text_captcha/types/maths_question.rb", "lib/nice_text_captcha/types/word_length_question.rb", "lib/nice_text_captcha/types/words_in_list_question.rb", "lib/nice_text_captcha.rb"]
  s.homepage = %q{http://github.com/smugx/nice_text_captcha}
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Generates Text Catpchas, that are 'nice' by my own personal definition!}
  s.add_dependency("linguistics")

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
  end
end
