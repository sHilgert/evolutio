class Level < ApplicationRecord
  def self.get_from_percentage(percentage)
    Level.where("minimum_percentage <= ? AND maximum_percentage >= ?", percentage, percentage).first
  end
end
