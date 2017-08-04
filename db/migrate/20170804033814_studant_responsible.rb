class StudantResponsible < ActiveRecord::Migration[5.1]
  def change
    create_table :studant_responsible do |t|
      t.references :teacher
      t.references :responsible
    end
  end
end
