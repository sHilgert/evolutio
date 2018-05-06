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

  def competence_average(competence)
    # user.skills
    user_skills = self.user_skills.job_skills.from_competence(competence)

    user_skills.each do |us|

    end
  end
end
