# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nice_text_captcha}
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Neil Smith"]
  s.date = %q{2011-08-17}
  s.email = %q{neil.jx.smith@gmail.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files         = Dir["README.markdown", "lib/**/*"]
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
