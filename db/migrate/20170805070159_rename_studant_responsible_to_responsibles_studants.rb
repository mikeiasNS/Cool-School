class RenameStudantResponsibleToResponsiblesStudants < ActiveRecord::Migration[5.1]
  def up
    rename_table :studant_responsible, :responsibles_studants
  end

  def down
    rename_table :responsibles_studants, :studant_responsible
  end
end
