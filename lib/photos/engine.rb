module Photos
  class Engine < ::Rails::Engine
    isolate_namespace Photos
  end
  require 'rubygems'
  require 'russian'
  require 'acts_as_list'
  require 'dragonfly'
  require 'will_paginate'
  require 'jquery-rails'
  require 'jquery-fileupload-rails'
end
