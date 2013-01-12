# Credentials
USERNAME = "username"
PASSWORD = "password"

# Basic authenication
use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == [USERNAME, PASSWORD]
end
