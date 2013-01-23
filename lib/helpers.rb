helpers do
  # Displays a message
  #
  # message = The given message. Redirects to another page with a different
  #           layout to display the message.
  #
  def message(message)
    @message = message
    erb :message
  end

  # Parses the date
  #
  #  today = yyyy-mm-dd
  #
  def date
    Date.today
  end

  # Gets the content
  #
  #   params[:content] = The given content from the input field.
  #
  def content
    params[:content]
  end

  # Gets the entry ID
  #
  #  Entry.get params[:id] = Gets the entry ID from the database.
  #
  def entry_id
    Entry.get params[:id]
  end
end
