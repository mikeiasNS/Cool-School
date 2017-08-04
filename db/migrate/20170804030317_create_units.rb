class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :name
      t.references :school

      t.timestamps
    end
  end
end
