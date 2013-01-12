helpers do
  # Display message
  def message(message)
    @message = message
    erb :message
  end

  # Parse date
  def date
    Date.today
  end

  # Get content
  def content
    params[:content]
  end

  # Get entry id
  def entry_id
    Entry.get params[:id]
  end
end
