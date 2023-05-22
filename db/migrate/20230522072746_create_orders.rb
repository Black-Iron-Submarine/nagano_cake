class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method
      t.integer :status
      t.integer :freight
      t.string :name
      t.integer :total_amount
      t.string :postcode
      t.string :address
      t.timestamps
    end
  end
end
