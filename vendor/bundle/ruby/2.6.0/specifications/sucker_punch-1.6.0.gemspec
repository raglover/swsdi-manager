# -*- encoding: utf-8 -*-
# stub: sucker_punch 1.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sucker_punch".freeze
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brandon Hilkert".freeze]
  s.date = "2015-10-20"
  s.description = "Asynchronous processing library for Ruby".freeze
  s.email = ["brandonhilkert@gmail.com".freeze]
  s.homepage = "https://github.com/brandonhilkert/sucker_punch".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Sucker Punch is a Ruby asynchronous processing using Celluloid, heavily influenced by Sidekiq and girl_friday.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<celluloid>.freeze, ["~> 0.17.2"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<celluloid>.freeze, ["~> 0.17.2"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<celluloid>.freeze, ["~> 0.17.2"])
  end
end
