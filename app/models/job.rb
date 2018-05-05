class Job < ApplicationRecord
  belongs_to :department
  has_many :job_skills
end
