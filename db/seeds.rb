puts "🌱 Seeding spices..."

# Seed your database here

puts "✅ Done seeding!"
puts "🌱 Seeding spices..."

# Seed your database here

Service_person.delete_all
Job.delete_all
Job_status.delete_all

nairobi_lon_min = 36.665297
nairobi_lon_max = 37.032825
nairobi_lat_min = -1.426108
nairobi_lat_max = -1.197672

job_status_ids = []
job_ids = []
service_persons_ids = []

#Create job status categories

job_status_ids << Job_status.create(category: 'Open')[:id]
job_status_ids << Job_status.create(category: 'Closed')[:id]

#Create 30 jobs
30.times do
    job_ids << Job.create(latitude: rand(nairobi_lat_min...nairobi_lat_max), 
                          longitude: rand(nairobi_lon_min...nairobi_lon_max), 
                          description: '', 
                          job_status_id: job_status_ids.sample)[:id]
end

#Create 10 service persons
10.times do
    full_name = Faker::Name.name
    first_name = full_name.split(' ')[0]
    last_name = full_name.split(' ')[1]
    # 60% chance that all service people are currently utilized in at least one job_id
    job_id = if rand() < 0.6 then job_ids.sample else nil end
    puts job_id
    Service_person.create(first_name: first_name, last_name: last_name, job_id: job_id)
end

puts "✅ Done seeding!"
