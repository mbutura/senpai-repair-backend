class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #Create a single entry
  post "/service_people" do
    service_person = ServicePerson.create(first_name: params[:first_name],
                                          last_name: params[:last_name])
    service_person.to_json
  end

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

  #Delete a single entry
  delete "/service_people/:id" do
    service_person = ServicePerson.find(params[:id])
    service_person.destroy
    service_person.to_json
  end

  #Create a single entry
  post "/jobs" do
    job = Jobs.create(latitude: params[:latitude],
                      longitude: params[:longitude],
                      description: params[:description],
                      job_status_id: params[:job_status_id],
                      service_person_id: params[:service_person_id])
    job.to_json
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

  #Delete a single entry
  delete "/jobs/:id" do
    job = Jobs.find(params[:id])
    job.destroy
    job.to_json
  end

  #Create a single entry
  post "/job_categories " do
    job_category = JobStatus.create(category: params[:category])
    job_category.to_json(only: [:id, :category])
  end

  #Used when displaying in a list
  get "/job_categories" do
    JobStatus.all.to_json(only: [:id, :category])
  end

  #Used when displaying in a single entry
  get "/job_categories/:id" do
    job_category = JobStatus.find(params[:id])
    job_category.to_json(only: [:id, :category])
  end

  #Delete a single entry
  delete "/job_categories/:id" do
    job_category = JobStatus.find(params[:id])
    job_category.destroy
    job_category.to_json(only: [:id, :category])
  end


end
