# Requirements
require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'date'

# Information
APP_NAME = "Journal."
APP_DESC = "What did you do today?"

# Database
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/db/journal.db")

class Entry
  include DataMapper::Resource
  property         :id, Serial
  property    :content, Text, :required => true
  property :created_on, Date
end

DataMapper.finalize.auto_upgrade!

# Journal
class Journal < Sinatra::Application
  # Helpers
  helpers do
    # Send message
    def message(message)
      @message = message
      erb :message
    end

    # Parse date
    def date
      date = Date.today.to_s
    end

    # Get entry id
    def entry_id
      entry_id = Entry.get params[:id]
    end
  end

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
