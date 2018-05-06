class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  belongs_to :competence

  scope :job_skills, -> { where(skill_type: 'job') }

  def self.from_user_and_competence(user, competence)
    self.where(user: user, competence: competence)
  end

  # def job_skill
  #   skill = self.skill
  #   JobSkill.find
  # end
end
