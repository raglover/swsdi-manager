# -*- encoding: utf-8 -*-
# stub: mina-unicorn 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mina-unicorn".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["tab".freeze, "Andrew Volozhanin".freeze]
  s.date = "2018-03-14"
  s.description = "Unicorn tasks for Mina".freeze
  s.email = ["scarfacedeb@gmail.com".freeze]
  s.homepage = "https://github.com/scarfacedeb/mina-unicorn".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Unicorn tasks for Mina".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mina>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<mina>.freeze, ["~> 1.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<mina>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
