class Skill < ApplicationRecord
  has_many :job_skills
  belongs_to :family
end
