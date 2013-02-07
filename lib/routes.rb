# Index
get '/' do
  @entry = Entry.all(:order => :id.desc)
  erb :index
end

# Create entry
get '/create' do
  message("Today's Date: #{date}")
  erb :create
end

# Save entry
post '/create' do
  Entry.create(:created_on => date,
               :content    => content)
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
  entry_id.update(:content => content)
  redirect '/'
end

# Delete entry
delete '/:id' do
  entry_id.destroy
  redirect '/'
end
