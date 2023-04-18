class School < ApplicationRecord
  has_many :teachers
  has_many :parents, through: :teachers
end
