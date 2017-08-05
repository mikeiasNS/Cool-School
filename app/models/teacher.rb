class Teacher < ApplicationRecord
  belongs_to :unit
  has_many :school_classes

  validates_presence_of :unit, :name, :cpf
end
