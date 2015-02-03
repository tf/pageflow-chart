# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "pageflow-chart"
  spec.version       = "0.1.0"
  spec.authors       = ["Tim Fischbach"]
  spec.email         = ["tfischbach@codevise.de"]
  spec.summary       = "Pagetype for Embedded Datawrapper Charts"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "pageflow", "~> 0.7"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "paperclip"
  spec.add_runtime_dependency "state_machine"
  spec.add_runtime_dependency "state_machine_job"
  spec.add_runtime_dependency 'i18n-js'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails", "~> 2.0"
  spec.add_development_dependency 'factory_girl_rails'
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "webmock"
end
