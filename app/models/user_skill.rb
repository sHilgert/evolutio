class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  belongs_to :job_skill

  scope :job_skills, -> { where(skill_type: 'job') }

  # def self.from_competence(competence)
  #   self.where(competence: competence)
  # end
end
