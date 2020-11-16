class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :price
      t.text :description
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
