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
  end
end
