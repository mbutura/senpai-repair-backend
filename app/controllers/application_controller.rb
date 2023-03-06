class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #Used when displaying in a list
  get "/service_people" do
    ServicePerson.all.to_json(only: [:id, :first_name, :last_name],
                              include: {jobs: {only: [:id, :latitude, :longitude, :description]}})
  end

  #Used when displaying in a single entry
  get "/service_people/:id" do
    service_person = ServicePerson.find(params[:id])
    service_person.to_json(only: [:id, :first_name, :last_name],
                              include: {jobs: {only: [:id, :latitude, :longitude, :description]}})
  end

  #Used when displaying in a list
  get "/jobs" do
    Job.all.to_json(only: [:id, :latitude, :longitude, :description], 
                    include: {job_status:{ only: [:category]},
                              service_person:{ only: [:first_name, :last_name]}})
  end

  #Used when displaying a single entry
  get "/jobs/:id" do
    job = Jobs.find(params[:id])
    job.to_json(only: [:id, :latitude, :longitude, :description], 
                    include: {job_status:{ only: [:category]},
                              service_person:{ only: [:first_name, :last_name]}})
  end

end
