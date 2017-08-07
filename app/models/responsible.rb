class Responsible < ApplicationRecord
  has_and_belongs_to_many :studants

  validates_presence_of :name, :cpf
end
