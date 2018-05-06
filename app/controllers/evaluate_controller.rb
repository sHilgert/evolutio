class EvaluateController < ApplicationController
  def index
    @users = User.where(leader_id: current_user.id).find_all
    @none = check_if_none
  end

  def create
    return if params[:data].length == 0
    params[:data]
    params[:data].each do |item|
      value = item[:value]
      user_skill = UserSkill.find(item[:id].to_i)
      user_skill.grade = value.to_i
      user_skill.save!
    end
    redirect_to evaluate_path
  end

  private

  def check_if_none
    none = true
    @users.each do |user|
      user.user_skills.each do |skill|
        if !skill.grade.present?
          none = false
        end
      end
    end
    none
  end
end
