class Unit < ApplicationRecord
  belongs_to :school
  has_many :classes, class_name: 'SchoolClass'
  has_many :studants, through: :classes
  has_many :teachers
  has_many :responsibles, class_name: 'Responsible', through: :studants

  validates_presence_of :school
end
