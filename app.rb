# Gem requirements
require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'date'

# App requirements
require './lib/models'
require './lib/helpers'
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

  # Create entry
  get '/create' do
    message("Today's Date: #{date}")
    erb :create
  end

  # Save entry
  post '/create' do
    entry = Entry.new
    entry.attributes = {
         :content => params[:content],
      :created_on => date }
    entry.save
    redirect '/'
  end

  # Get entry
  get '/:id' do
    @entry = entry_id
    if @entry
      erb :edit
    else
      message("The entry couldn't be found.")
    end
  end

  # Edit entry
  put '/:id' do
    entry = entry_id
    entry.attributes = {
      :content => params[:content] }
    entry.save
    redirect '/'
  end

  # Delete entry
  delete '/:id' do
    entry = entry_id
    entry.destroy
    redirect '/'
  end
end
