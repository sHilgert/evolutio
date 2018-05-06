class AddJobSkillToUserSkills < ActiveRecord::Migration[5.1]
  def up
    change_table :user_skills do |t|
      t.references :job_skill
    end

    remove_column :user_skills, :competence_id
  end

  def down
    change_table :user_skills do |t|
      t.references :competence
    end

    remove_column :user_skills, :job_skill_id
  end
end
