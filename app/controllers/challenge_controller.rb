class ChallengeController < ApplicationController
  include ChallengeHelper

  before_action :authenticate_user!

  def index
    @leaders = [
      "Yugue", "Ney", "Pufe", "Roger"
    ].map(&:downcase)
    @skills = get_job_skills(current_user)
    @selectedSkills = []
  end

  def create
  end
end
