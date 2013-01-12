# Gem requirements
require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'date'

# App requirements
require './lib/models'
require './lib/helpers'
require './lib/routes'
require './lib/auth'

# App information
APP_NAME = "Journal."
APP_DESC = "What did you do today?"

# Journal
class Journal < Sinatra::Application
  # Index
  get '/' do
    @entry = Entry.all :order => :id.desc
    erb :index
  end
end
