class AddSomeInfoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :job_id, :integer, references: :job, index: true
    add_column :users, :leader_id, :integer, references: :user, index: true
  end
end
