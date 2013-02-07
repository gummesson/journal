# Gems
require 'rubygems'
require 'sinatra'
require 'data_mapper'

# Standard Library
require 'date'

# Information
APP_NAME = "Journal."
APP_DESC = "What did you do today?"

# App Library
require 'lib/models'
require 'lib/helpers'
require 'lib/routes'
require 'lib/auth'
