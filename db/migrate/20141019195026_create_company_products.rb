class CreateCompanyProducts < ActiveRecord::Migration
  def change
    create_table :company_products do |t|
      t.integer :product_id
      t.integer :company_id
      t.float :quantity
      t.string :quantity_unit
      t.float :price
      t.string :price_unit

      t.timestamps
    end
  end
end
