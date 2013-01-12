# Helpers
helpers do
  # Send message
  def message(message)
    @message = message
    erb :message
  end

  # Parse date
  def date
    date = Date.today
  end

  # Get entry id
  def entry_id
    entry_id = Entry.get params[:id]
  end
end
