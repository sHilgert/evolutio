class Skill < ApplicationRecord
  has_many :job_skills
  has_many :user_skills
  belongs_to :family
end
