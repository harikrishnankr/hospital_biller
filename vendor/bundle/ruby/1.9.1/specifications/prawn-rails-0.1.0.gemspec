# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "prawn-rails"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carlos Ortiz"]
  s.date = "2014-10-07"
  s.description = "Prawn Handler for RoR 3.x/4.x projects handles and registers pdf formats"
  s.email = ["chrono.dark@gmail.com"]
  s.homepage = "https://github.com/cortiz/prawn-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Prawn Handler for RoR 3.x/4.x projects"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<prawn>, [">= 0"])
      s.add_runtime_dependency(%q<prawn-table>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.1.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<prawn>, [">= 0"])
      s.add_dependency(%q<prawn-table>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.1.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<prawn>, [">= 0"])
    s.add_dependency(%q<prawn-table>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.1.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
