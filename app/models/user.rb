class User < ApplicationRecord
  belongs_to :job, optional: true
  has_one :leader, class_name: 'User'
  has_many :user_skills

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[slack]

  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user.email = "#{auth.info.user}@bla.com"
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming
      user.save
      user
    else
      user = User.create(email: "#{auth.info.user}@bla.com", password: Devise.friendly_token[0,20], name: auth.info.name, avatar: auth.info.image)
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

      value_total += weight * grade
      weight_total += weight
    end

    value_total / weight_total / 5 * 100
  end

  def job_level
    # passar a porcentagem total e calcular o level
    Level.get_from_percentage(total_average_percentage / 100)
  end
end
