class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @skills = [
      {
        name: "Skill 1",
        percentage: 25,
        list: [
          {
            name: "Skill 11",
            checked: true,
            grade: 7.8
          },
          {
            name: "Skill 12",
            checked: true,
            grade: 10.0
          }
        ]
      },
      {
        name: "Skill 2",
        percentage: 35,
        list: [
          {
            name: "Skill 21",
            checked: false,
            grade: 2.8
          },
          {
            name: "Skill 22",
            checked: true,
            grade: 8.4
          }
        ]
      }
    ]
  end
end
