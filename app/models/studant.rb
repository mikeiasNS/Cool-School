class Studant < ApplicationRecord
  belongs_to :unit
  has_and_belongs_to_many :responsibles
  has_and_belongs_to_many :school_classes

  validates_presence_of :name, :birthday, :unit_id
  validate :at_least_one_responsible

  private
  def at_least_one_responsible
    unless self.responsibles.any?
      errors.add :responsibles, :studant_should_have_a_responsible
    end
  end
end