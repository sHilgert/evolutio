class Job < ApplicationRecord
  belongs_to :department
  has_many :job_skills
  has_many :skills, through: :job_skills
  has_many :competences, through: :job_skills
  has_many :users
end
