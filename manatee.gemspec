# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'manatee/version'

Gem::Specification.new do |spec|
  spec.name          = 'manatee'
  spec.version       = Manatee::VERSION
  spec.summary       = %q{Javascript Template Render [for Rails]?}
  spec.description   = %q{Renders javascript templates with ease on client and server sides}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.authors       = ['Dalton Pinto', 'Felipe JAPM']
  spec.email         = ['dalton@akidog.com.br', 'felipe@akidog.com.br']

  spec.files         = Dir['{app,bin,lib,test,spec}/**/*'] + ['manatee.gemspec', 'LICENSE.txt', 'Rakefile', 'Gemfile', 'README.mdown']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }

  spec.require_paths = ['lib']

  spec.add_dependency 'i18n-js', '3.0'
  spec.add_dependency 'execjs', '~> 2.7.0'
  spec.add_dependency 'sprockets', '~> 3.7'
  spec.add_dependency 'coffee-script', '~> 2.4.0'

  spec.add_development_dependency 'rake', '~> 11.2'
  spec.add_development_dependency 'bundler', '~> 1.13.0'
  spec.add_development_dependency 'nokogiri', '~> 1.6.0'
end
