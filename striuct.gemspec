# coding: us-ascii

lib_name = 'striuct'.freeze

Gem::Specification.new do |gem|
  # specific

  gem.description   = %q{Struct++ library.

---

  Validatable, Inheritable, Member Aliasing,
  Conflict Management, Default Value, Divide nil with unassign,
  Lock setter of each member, Hash flendly API, ... And more Struct++ features :)}

  gem.summary       = gem.description.dup
  gem.homepage      = "https://github.com/kachick/#{lib_name}"
  gem.license       = 'MIT'
  gem.name          = lib_name.dup
  gem.version       = '0.5.0'

  gem.required_ruby_version = '>= 2.0'

  gem.add_runtime_dependency 'validation', '~> 0.0.7'
  gem.add_runtime_dependency 'optionalargument', '~> 0.1'
  gem.add_runtime_dependency 'keyvalidatable', '~> 0.0.5'

  gem.add_development_dependency 'test-unit', '>= 3.1.1', '< 4'
  gem.add_development_dependency 'yard', '>= 0.8.7.6', '< 0.9'
  gem.add_development_dependency 'rake', '>= 10', '< 20'
  gem.add_development_dependency 'bundler', '>= 1.10', '< 2'

  if RUBY_ENGINE == 'rbx'
    gem.add_dependency 'rubysl', '~> 2.1'
  end

  # common

  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
