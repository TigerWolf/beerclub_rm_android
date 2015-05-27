# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
# $:.unshift("/Library/RubyMotion3.1/lib")
require 'motion/project/template/android'

begin
require 'bundler'
Bundler.require
rescue LoadError
end


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'beerclub'
  app.volley
  app.api_version = "19"
  app.target_api_version = "21"
  app.permissions = [:internet, :camera]
  app.package = "com.tigerwolf.beerclub"
  # app.main_activity = "LoginActivity"
  app.main_activity = "LoginActivity"
  app.sub_activities = ['BeerActivity', 'AccountActivity', 'ScannerActivity', 'AvaliableActivity']

  # app.vendor_project jar: "vendor/volley-1.0.9.jar"
  # app.vendor_project jar: "vendor/zxing/classes.jar"
  app.vendor_project jar: "vendor/core-zxing-3.1.0.jar" # Google Library
  # app.vendor_project jar: "vendor/zxing-core.jar" # Core barcodescanner
  app.vendor_project jar: "vendor/android-integration-3.1.0.jar" # Android Google Library ZXing
  app.vendor_project jar: "vendor/commons-io-2.4.jar"

  app.release_keystore('/Users/a1673450/dev/timetable_phonegap/key/timetable-phonegap-key.keystore','uofa_timetable')

  # android:largeHeap=true
  # android:configChanges="keyboardHidden|orientation"
end
