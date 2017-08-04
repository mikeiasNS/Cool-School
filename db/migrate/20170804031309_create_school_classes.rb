class CreateSchoolClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :school_classes do |t|
      t.references :teacher, foreign_key: true
      t.integer :number
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
