class InsertLevels < SeedMigration::Migration
  LEVELS = [["Estagiário", 0.00, 0.4], ["Jr", 0.4, 0.55], ["Jr +", 0.55, 0.65], ["Pleno", 0.65, 0.8], ["Pleno +", 0.8, 0.85], ["Senior", 0.85, 0.9], ["Senior +", 0.9, 0.95], ["Hero", 0.95, 1.00]]

  def up
    LEVELS.each do |l, min, max|
      Level.create(name: l, minimum_percentage: min, maximum_percentage: max)
    end
  end

  def down
    Level.destroy_all
  end
end
