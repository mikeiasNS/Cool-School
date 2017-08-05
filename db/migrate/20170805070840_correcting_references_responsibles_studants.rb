class CorrectingReferencesResponsiblesStudants < ActiveRecord::Migration[5.1]
  def change
    remove_column :responsibles_studants, :teacher_id
    add_reference :responsibles_studants, :studant
  end
end
