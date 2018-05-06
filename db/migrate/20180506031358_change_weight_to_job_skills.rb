class ChangeWeightToJobSkills < ActiveRecord::Migration[5.1]
  def up
    remove_column :competences, :weight
    add_column :job_skills, :weight, :integer, default: 1
  end

  def down
    add_column :competences, :weight, :integer
    remove_column :job_skills, :weight
  end
end
