module ChallengeHelper

  def get_job_skills(user)
    user.job.job_skills.collect {|js| { id: js.skill.id, skill: js.skill.description.downcase } }
  end
end
