class Responsible < ApplicationRecord
  has_and_belongs_to_many :studants

  validates_presence_of :name, :cpf
  validate :should_have_a_studant

  private
  def should_have_a_studant
    errors.add :studants, :responsible_should_have_a_studant if self.studants.empty?
  end
end
