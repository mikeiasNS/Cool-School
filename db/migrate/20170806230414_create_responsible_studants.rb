class CreateResponsibleStudants < ActiveRecord::Migration[5.1]
  def change
    create_table :responsible_studants do |t|
      t.references :responsible, foreign_key: true
      t.references :studant, foreign_key: true

      t.timestamps
    end
  end
end
