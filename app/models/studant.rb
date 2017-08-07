class Studant < ApplicationRecord
  belongs_to :school_class
  has_and_belongs_to_many :responsibles

  validates_presence_of :name, :birthday, :school_class_id
end