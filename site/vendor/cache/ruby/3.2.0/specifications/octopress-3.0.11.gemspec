# -*- encoding: utf-8 -*-
# stub: octopress 3.0.11 ruby lib

Gem::Specification.new do |s|
  s.name = "octopress".freeze
  s.version = "3.0.11".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brandon Mathis".freeze, "Parker Moore".freeze]
  s.date = "2015-07-15"
  s.email = ["brandon@imathis.com".freeze, "parkrmoore@gmail.com".freeze]
  s.executables = ["octopress".freeze]
  s.files = ["bin/octopress".freeze]
  s.homepage = "http://octopress.org".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.4.7".freeze
  s.summary = "Octopress is an obsessively designed framework for Jekyll blogging. It\u2019s easy to configure and easy to deploy. Sweet huh?".freeze

  s.installed_by_version = "3.6.3".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<mercenary>.freeze, ["~> 0.3.2".freeze])
  s.add_runtime_dependency(%q<jekyll>.freeze, [">= 2.0".freeze])
  s.add_runtime_dependency(%q<titlecase>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<octopress-deploy>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<octopress-hooks>.freeze, ["~> 2.0".freeze])
  s.add_runtime_dependency(%q<octopress-escape-code>.freeze, ["~> 2.0".freeze])
  s.add_runtime_dependency(%q<redcarpet>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<octopress-ink>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<clash>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0".freeze])
end
