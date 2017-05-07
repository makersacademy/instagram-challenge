# -*- encoding: utf-8 -*-
# stub: erubi 1.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "erubi"
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jeremy Evans", "kuwata-lab.com"]
  s.date = "2017-02-27"
  s.description = "Erubi is a ERB template engine for ruby. It is a simplified fork of Erubis"
  s.email = "code@jeremyevans.net"
  s.extra_rdoc_files = ["README.rdoc", "CHANGELOG", "MIT-LICENSE"]
  s.files = ["CHANGELOG", "MIT-LICENSE", "README.rdoc"]
  s.homepage = "https://github.com/jeremyevans/erubi"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--quiet", "--line-numbers", "--inline-source", "--title", "Erubi: Small ERB Implementation", "--main", "README.rdoc"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Small ERB Implementation"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
