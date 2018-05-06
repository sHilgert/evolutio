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
    binding.pry

    params = permit_params

    skills = params["skills"]
    users = params["users"]

    return if skills.none? || users.none?

    skills = skills.reject(&:empty?)
    users = users.reject(&:empty?)

    current_user.leader = users.first

    skills.each do |skill|
      UserSkill.create(skill: skill, user: current_user, grade: nil, job: current_user.job)
    end
  end

  def permit_params
    params.permit('data', 'evaluate', 'skills', 'users', 'description')
  end
end
