class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :price_without_tax
      t.boolean :sales_status
      t.timestamps
    end
  end
end
