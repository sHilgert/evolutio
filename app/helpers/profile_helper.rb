module ProfileHelper
  include ActionView::Helpers::NumberHelper

  def round_five(number)
    (number / 5).round * 5
  end

  def pry_legal
    binding.pry
  end

  def profile_data_json(user)
    {
      name: user.name,
      job: user.job.name,
      level: user.job_level.name,
      avatar: user.avatar,
      skills: get_competences(user)
    }
  end

  def get_competences(user)
    competences = user.job.job_skills.map { |js| js.competence }.uniq

    array = []

    competences.each do |competence|
      array << {
        name: competence.name,
        percentage: user.competence_average_percentage(competence),
        list: get_skills(user, competence)
      }
    end

    array
  end

  def get_skills(user, competence)
    user_skills = user.user_skills.job_skills.from_competence(competence)

    array = []

    user_skills.each do |user_skill|
      array << {
        name: user_skill.skill.description,
        grade: number_with_precision(user_skill.grade, precision: 2),
        weight: user_skill.job_skill.weight
      }
    end

    array
  end
end
