class AddCompetenceToUserSkills < ActiveRecord::Migration[5.1]
  def up
    change_table :user_skills do |t|
      t.references :competence
    end
  end

  def down
    remove_column :users, :competence_id
  end
end
