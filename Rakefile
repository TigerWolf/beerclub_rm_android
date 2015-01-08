# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/android'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'beerclub'
  app.api_version = "21"
  app.permissions = [:internet]
  app.package = "com.tigerwolf.beerclub"
  app.main_activity = "LoginActivity"
  # app.main_activity = "BeerActivity"
  app.sub_activities = ['BeerActivity']

  app.vendor_project jar: "vendor/volley-1.0.9.jar"
end
