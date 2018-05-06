class User < ApplicationRecord
  belongs_to :job
  has_one :leader, class_name: 'User'
  has_many :user_skills

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[slack]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = "#{auth.info.user}@bla.com"
      user.password = Devise.friendly_token[0,20]
      #user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def competence_average(competence)
    # user.skills
    user_skills = self.user_skills.job_skills.from_competence(competence)

    user_skills.each do |us|
      
    end
  end
end
