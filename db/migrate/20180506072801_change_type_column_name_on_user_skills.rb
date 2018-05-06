class ChangeTypeColumnNameOnUserSkills < ActiveRecord::Migration[5.1]
  def up
    rename_column :user_skills, :type, :skill_type
  end

  def down
    # caguei
  end
end
