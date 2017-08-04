class CreateStudants < ActiveRecord::Migration[5.1]
  def change
    create_table :studants do |t|
      t.string :name
      t.date :birthday
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
