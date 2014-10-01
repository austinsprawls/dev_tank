# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "google-webfonts"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Travis Haynes"]
  s.date = "2014-04-17"
  s.description = "Google Webfonts helper for Rails or Sinatra applications."
  s.email = ["travis.j.haynes@gmail.com"]
  s.homepage = "https://github.com/travishaynes/Google-Webfonts-Helper"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Provides a helper for using Google Webfonts in Rails or Sinatra, although it can be used outside of those frameworks as well."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 3.0.0"])
      s.add_development_dependency(%q<bundler>, ["< 2.0", ">= 1.3.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.3.3"])
      s.add_development_dependency(%q<sinatra>, ["~> 1.3.2"])
    else
      s.add_dependency(%q<actionpack>, [">= 3.0.0"])
      s.add_dependency(%q<bundler>, ["< 2.0", ">= 1.3.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 5.3.3"])
      s.add_dependency(%q<sinatra>, ["~> 1.3.2"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 3.0.0"])
    s.add_dependency(%q<bundler>, ["< 2.0", ">= 1.3.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 5.3.3"])
    s.add_dependency(%q<sinatra>, ["~> 1.3.2"])
  end
end
