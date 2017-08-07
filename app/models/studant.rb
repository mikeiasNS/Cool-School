class Studant < ApplicationRecord
  belongs_to :school_class
  has_and_belongs_to_many :responsibles

  validates_presence_of :name, :birthday, :school_class_id
  # validate :at_least_one_responsible

  private
  def at_least_one_responsible
    unless self.responsibles.any?
      errors.add :responsibles, :studant_should_have_a_responsible
    end
  end
end