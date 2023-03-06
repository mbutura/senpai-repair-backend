class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/service_people" do
    Service_person.all.to_json
  end

end
