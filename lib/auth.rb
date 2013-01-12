# Credentials
USERNAME = "username"
PASSWORD = "password"

# Basic authenication
use Rack::Auth::Basic, "Restricted area" do |username, password|
  [username, password] == [USERNAME, PASSWORD]
end
