module Photos
  class Engine < ::Rails::Engine
    isolate_namespace Photos
    config.to_prepare do
      Photos::ApplicationController.helper Rails.application.helpers
    end
  end
  require 'rubygems'
  require 'russian'
  require 'acts_as_list'
  require 'dragonfly'
  require 'will_paginate'
  require 'jquery-rails'
  require 'jquery-fileupload-rails'
  require 'font-awesome-rails'
end
