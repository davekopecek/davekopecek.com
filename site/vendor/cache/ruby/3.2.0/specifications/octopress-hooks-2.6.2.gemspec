# -*- encoding: utf-8 -*-
# stub: octopress-hooks 2.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "octopress-hooks".freeze
  s.version = "2.6.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brandon Mathis".freeze]
  s.date = "2016-09-15"
  s.email = ["brandon@imathis.com".freeze]
  s.homepage = "http://github.com/octopress/hooks".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.1".freeze
  s.summary = "Allows access to Jekyll's site, posts and pages at different points in the life cycle of a build. Formerly known as 'jekyll-page-hooks'.".freeze

  s.installed_by_version = "3.6.3".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<jekyll>.freeze, [">= 2.0".freeze])
  s.add_development_dependency(%q<clash>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<octopress-debugger>.freeze, [">= 0".freeze])
end
