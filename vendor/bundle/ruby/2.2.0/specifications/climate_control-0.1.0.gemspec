# -*- encoding: utf-8 -*-
# stub: climate_control 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "climate_control"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Joshua Clayton"]
  s.date = "2017-01-07"
  s.description = "Modify your ENV"
  s.email = ["joshua.clayton@gmail.com"]
  s.homepage = "https://github.com/thoughtbot/climate_control"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Modify your ENV easily with ClimateControl"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.3.2"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.9.1"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_dependency(%q<rake>, ["~> 10.3.2"])
      s.add_dependency(%q<simplecov>, ["~> 0.9.1"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    s.add_dependency(%q<rake>, ["~> 10.3.2"])
    s.add_dependency(%q<simplecov>, ["~> 0.9.1"])
  end
end
