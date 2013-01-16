# Require Bundler
require 'bundler'
Bundler.require

# Set app directory as root
$:.unshift File.dirname(__FILE__)

# Require the app...
require 'app'

# ...and run it.
run Sinatra::Application
