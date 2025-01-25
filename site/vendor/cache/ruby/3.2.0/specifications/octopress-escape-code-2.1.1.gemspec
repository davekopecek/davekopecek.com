# -*- encoding: utf-8 -*-
# stub: octopress-escape-code 2.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "octopress-escape-code".freeze
  s.version = "2.1.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brandon Mathis".freeze]
  s.date = "2015-12-09"
  s.description = "Return tag renders a variable with some nice features".freeze
  s.email = ["brandon@imathis.com".freeze]
  s.homepage = "https://github.com/octopress/escape-code".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.4.5".freeze
  s.summary = "Return tag renders a variable with some nice features".freeze

  s.installed_by_version = "3.6.3".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<jekyll>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6".freeze])
  s.add_development_dependency(%q<redcarpet>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<clash>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<octopress-codeblock>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0".freeze])
end
