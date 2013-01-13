# Gem requirements
require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'date'

# App information
APP_NAME = "Journal."
APP_DESC = "What did you do today?"

# App requirements
require './lib/models'
require './lib/helpers'
require './lib/routes'
require './lib/auth'
