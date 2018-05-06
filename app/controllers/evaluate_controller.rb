class EvaluateController < ApplicationController
  def index
    @users = User.where(leader_id: current_user.id).find_all
    @none = check_if_none
  end

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
