class ChallengeController < ApplicationController
  def index
    # array de hashes com {id: job_skill.id, skill: job_skill.skill.description}
    current_user.job.job_skills
  end
end


{ competence_id: 1, skill_id: 2, job_id: 4 }