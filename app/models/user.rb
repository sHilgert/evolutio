class User < ApplicationRecord
  belongs_to :job, optional: true
  has_one :leader, foreign_key: 'leader_id', class_name: 'User'
  has_many :user_skills

  # Include default devise modules. Others available are:|
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[slack]

  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user
    else
      user = User.create(email: "#{auth.info.user}@bla.com", password: Devise.friendly_token[0,20], name: auth.info.name, avatar: auth.info.image, job: Job.where(name: ['Desenvolvedor Back-end', 'Desenvolvedor Front-end', 'BI Analyst', 'Guia do Aluno - Telefone', 'Guia do Aluno - Chat', 'Líder de Vendas', 'Operações', 'Tech Lead', 'Product Owner']).sample)
      user.populate_skills
      user
    end
  end

  def competence_average_percentage(competence)
    user_skills = self.user_skills.job_skills.from_competence(competence)

    average_from_user_skills(user_skills)
  end

  def total_average_percentage
    user_skills = self.user_skills.job_skills

    average_from_user_skills(user_skills)
  end

  def average_from_user_skills(user_skills)
    weight_total = 0
    value_total = 0

    user_skills.each do |us|
      weight = us.job_skill.weight
      grade = us.grade

      next if grade.blank?
      value_total += weight * grade
      weight_total += weight
    end

    if weight_total > 0
      value_total / weight_total / 5 * 100
    else
      0
    end
  end

  def job_level
    # passar a porcentagem total e calcular o level
    Level.get_from_percentage(total_average_percentage / 100)
  end

  def populate_skills
    return unless self.user_skills.none?

    j = self.job
    job_skills = j.job_skills

    job_skills.each do |job_skill|
      us = UserSkill.new
      us.grade = rand(0.00..5.00)
      us.skill = job_skill.skill
      us.skill_type = 'job'
      us.job_skill = job_skill
      us.user = self
      us.save!
    end
  end
end
