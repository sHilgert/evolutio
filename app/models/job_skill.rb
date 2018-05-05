class JobSkill < ApplicationRecord
  belongs_to :competence
  belongs_to :job
  belongs_to :skill
end
