class CreateResponsibles < ActiveRecord::Migration[5.1]
  def change
    create_table :responsibles do |t|
      t.string :name
      t.string :cpf
      t.string :birthday

      t.timestamps
    end
  end
end
