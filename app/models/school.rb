class School < ApplicationRecord
  has_many :units

  validates_presence_of :name
end
