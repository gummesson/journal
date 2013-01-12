# Setup database
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/db/journal.db")

# Entry properties
class Entry
  include DataMapper::Resource
  property         :id, Serial
  property    :content, Text, :required => true
  property :created_on, Date
end

# Initialize database
DataMapper.finalize.auto_upgrade!
