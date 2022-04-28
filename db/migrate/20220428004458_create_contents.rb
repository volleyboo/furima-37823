class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.text :explanation, null: false
      t.integer :category, null: false
      t.integer :state, null: false
      t.integer :charge, null: false
      t.integer :area, null: false
      t.integer :days, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
