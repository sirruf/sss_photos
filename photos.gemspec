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
  s.licenses = ['MIT']

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir["test/**/*"]

  s.add_dependency('rails', '~> 4.2')
  s.add_dependency('russian', '~> 0')
  s.add_dependency('acts_as_list', '~> 0')
  s.add_dependency('dragonfly', '~> 0')
  s.add_dependency('will_paginate', '~> 0')
  s.add_dependency('jquery-rails', '~> 0')
  s.add_dependency('jquery-fileupload-rails', '~> 0')
  s.add_dependency('font-awesome-rails', '~> 0')

  s.add_development_dependency('sqlite3', '~> 0')
end
