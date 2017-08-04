class SchoolClass < ApplicationRecord
  belongs_to :teacher
  belongs_to :unit
end
