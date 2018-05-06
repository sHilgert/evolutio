class ProfileController < ApplicationController
  include ProfileHelper

  before_action :authenticate_user!

  def index
    @profile = {
      name: "João da Silva",
      job: "Desenvolvedor Front-end",
      avatar: "http://s3.amazonaws.com/37assets/svn/765-default-avatar.png",
        skills: [
        {
          name: "Skill 1",
          percentage: round_five(25),
          list: [
            {
              name: "Skill 11",
              grade: 7.8
            },
            {
              name: "Skill 12",
              grade: 10.0
            }
          ]
        },
        {
          name: "Skill 2",
          percentage: round_five(35),
          list: [
            {
              name: "Skill 21",
              grade: 2.8
            },
            {
              name: "Skill 22",
              grade: 8.4
            }
          ]
        }
      ]
    }
  end
end
