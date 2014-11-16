class CreateCasas < ActiveRecord::Migration
  def change
    create_table :casas do |t|
      t.string :nombre
      t.integer :patrimonio
      t.integer :fundada_en

      t.timestamps
    end
  end
end
