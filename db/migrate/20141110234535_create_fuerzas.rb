class CreateFuerzas < ActiveRecord::Migration
  def change
    create_table :fuerzas do |t|
      t.string :type
      t.integer :cantidad_soldados
      t.integer :cantidad_barcos
      t.integer :cantidad_dragones
      t.integer :poder
      t.string :nombre
      t.references :casa

      t.timestamps
    end
  end
end
