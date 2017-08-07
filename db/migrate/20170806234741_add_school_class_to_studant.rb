class AddSchoolClassToStudant < ActiveRecord::Migration[5.1]
  def change
    add_reference :studants, :school_class
  end
end
