$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'photos/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'photos'
  s.version     = Photos::VERSION
  s.authors     = ['Artem Kolesnikov']
  s.email       = ['sirruf@me.com']
  s.homepage    = 'http://it-assist.info/sss'
  s.summary     = 'SSS Photos Module'
  s.description = 'Simple Site System Photo Module'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.0.8'
  s.add_dependency 'russian'
  s.add_dependency 'mini_magick'
  s.add_dependency 'carrierwave'
  s.add_dependency 'acts_as_list'
  s.add_dependency 'will_paginate'
  s.add_dependency 'jquery-rails'

  s.add_development_dependency 'sqlite3'
end
