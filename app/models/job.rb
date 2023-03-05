class Job< ActiveRecord::Base
    has_many :service_persons
    belongs_to :job_status
  end