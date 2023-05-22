class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :name
      t.integer :postcode
      t.string :address
      t.timestamps
    end
  end
end
