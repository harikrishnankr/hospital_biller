# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails-ajax"
  s.version = "1.0.0.20140320"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Muriel Salvan"]
  s.date = "2014-03-20"
  s.description = "Add Ajax capabilities to Rails websites, with minimal code changes. Supports history, bookmarking, partial refreshes, Rails flashes, user callbacks, scripts execution, redirections. Built upon Rails-UJS and jQuery."
  s.email = "muriel@x-aeon.com"
  s.homepage = "http://rails-ajax.sourceforge.net"
  s.require_paths = ["lib"]
  s.rubyforge_project = "rails-ajax"
  s.rubygems_version = "1.8.23"
  s.summary = "Add Ajax capabilities to Rails websites with history, bookmarking, partial refreshes, Rails flashes, user callbacks, scripts execution, redirections."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.2.1"])
    else
      s.add_dependency(%q<rails>, [">= 3.2.1"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.2.1"])
  end
end
