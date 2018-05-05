class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name

      t.timestamps
    end

    create_table :jobs do |t|
      t.string :name
      t.references :department

      t.timestamps
    end

    create_table :competences do |t|
      t.string :name
      t.integer :weight
      t.string :area

      t.timestamps
    end

    create_table :skills do |t|
      t.string :description
      t.references :family

      t.timestamps
    end

    create_table :families do |t|
      t.string :key

      t.timestamps
    end

    create_table :job_skills do |t|
      t.references :job
      t.references :competence
      t.references :skill

      t.timestamps
    end

    create_table :user_skills do |t|
      t.references :user
      t.references :skill
      t.integer :grade
      t.string :type

      t.timestamps
    end
  end
end
