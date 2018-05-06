class ChallengeController < ApplicationController
  include ChallengeHelper

  before_action :authenticate_user!

  def index
    @users = get_users(current_user)
    @skills = get_job_skills(current_user)
    @selectedSkills = []
    @selectedUsers = []
  end

  def create
    skills = params["skills"]
    users = params["users"]

    return if skills.none? || users.none?

    skills = skills.reject(&:empty?).map(&:to_i)
    users = users.reject(&:empty?).map(&:to_i)

    current_user.leader_id = users.first
    current_user.save!

    skills.each do |skill|
      UserSkill.create(skill_id: skill, user: current_user, grade: nil, job_skill: current_user.job.job_skills.where(skill: skill).first)
    end
  end
end
