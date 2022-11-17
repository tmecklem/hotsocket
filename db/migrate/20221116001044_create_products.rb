class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.string :description
      t.integer :inventory

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
