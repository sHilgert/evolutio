module ApplicationHelper

  def get_user_skills(user)
    return if user.blank?
    list = []
    user.user_skills.each do |user_skill|
      if user_skill.grade.blank?
        list << user_skill
      end
    end
    list
  end
end
