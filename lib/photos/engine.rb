module Photos
  class Engine < ::Rails::Engine
    isolate_namespace Photos
  end
  require 'rubygems'
  require 'mini_magick'
  require 'carrierwave'
  require 'acts_as_list'
  require 'will_paginate'
end
