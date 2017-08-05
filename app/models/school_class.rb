class SchoolClass < ApplicationRecord
  belongs_to :teacher
  belongs_to :unit
  has_and_belongs_to_many :studants

  validates_presence_of :teacher_id, :unit_id, :number
end
