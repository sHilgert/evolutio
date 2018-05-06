module ChallengeHelper
  def get_job_skills(user)
    user.job.job_skills.collect { |js| { id: js.skill.id, skill: js.skill.description.downcase } }
  end

  def get_users(user)
    User.where.not(id: user.id).collect { |u| { id: u.id, user: u.name.downcase } }
  end
end
