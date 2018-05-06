class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  belongs_to :job_skill

  scope :job_skills, -> { where(skill_type: 'job') }

  def self.from_competence(competence)
    self.joins(:job_skill).where("job_skills.competence_id = ?", competence.id)
  end
end
