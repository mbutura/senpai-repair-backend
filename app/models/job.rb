class Job< ActiveRecord::Base
    belongs_to :service_person
    belongs_to :job_status
  end