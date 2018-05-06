class ChangeGradeDataTypeToFloat < ActiveRecord::Migration[5.1]
  def up
    change_table :user_skills do |t|
      t.change :grade, :float, :precision => 3, :scale => 2
    end
  end

  def down
    change_table :user_skills do |t|
      t.change :grade, :integer
    end
  end
end
