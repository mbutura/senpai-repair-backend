class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #Used when displaying in a list
  get "/service_people" do
    ServicePerson.all.to_json(only: [:id, :first_name, :last_name],
                              include: {jobs: {only: [:id, :latitude, :longitude, :description]}})
  end

  #Used when displaying in a list
  get "/jobs" do
    Job.all.to_json(only: [:id, :latitude, :longitude, :description], 
                    include: {job_status:{ only: [:category]},
                              service_person:{ only: [:first_name, :last_name]}})
  end

end
