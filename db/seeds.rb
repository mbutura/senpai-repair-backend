puts "🌱 Seeding spices..."



nairobi_lon_min = 36.665297
nairobi_lon_max = 37.032825
nairobi_lat_min = -1.426108
nairobi_lat_max = -1.197672

job_status_ids = []
job_ids = []
service_persons_ids = []

#Create job status categories

job_status_ids << JobStatus.create(category: 'Open')[:id]
job_status_ids << JobStatus.create(category: 'Closed')[:id]

#Create 20 service people
20.times do
    full_name = Faker::Name.name
    first_name = full_name.split(' ')[0]
    last_name = full_name.split(' ')[1]
    service_persons_ids << ServicePerson.create(first_name: first_name, last_name: last_name)[:id]
end

#Create 30 jobs
selected_service_people_ids  = []
30.times do
    selected_service_people_ids << (service_persons_ids - selected_service_people_ids).sample
    job_ids << Job.create(latitude: rand(nairobi_lat_min...nairobi_lat_max), 
                          longitude: rand(nairobi_lon_min...nairobi_lon_max), 
                          description: '', 
                          job_status_id: job_status_ids.sample,
                          service_person_id: selected_service_people_ids.last)[:id]
end



puts "✅ Done seeding!"
