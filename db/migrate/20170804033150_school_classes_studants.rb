class SchoolClassesStudants < ActiveRecord::Migration[5.1]
  def change
    create_table :school_classes_studants do |t|
      t.references :school_class
      t.references :studant
    end
  end
end
