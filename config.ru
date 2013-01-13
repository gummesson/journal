# Require Bundler
require 'bundler'
Bundler.require

# Require the app...
require './app'

# ...and run it.
run Sinatra::Application
