class SchoolClass < ApplicationRecord
  belongs_to :teacher
  belongs_to :unit
  has_many :studants

  validates_presence_of :teacher_id, :unit_id, :number

  def full_name
    "#{self.unit.name} - #{self.number}"
  end
end
