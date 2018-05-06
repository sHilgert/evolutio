class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.string :name
      t.float :minimum_percentage, :precision => 3, :scale => 2
      t.float :maximum_percentage, :precision => 3, :scale => 2

      t.timestamps
    end
  end
end
