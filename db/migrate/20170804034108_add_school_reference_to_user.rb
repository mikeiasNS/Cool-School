class AddSchoolReferenceToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :school, index: true
  end
end
