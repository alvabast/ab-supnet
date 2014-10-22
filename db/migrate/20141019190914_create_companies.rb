class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :type
      t.integer :user_id
      t.string :name
      t.string :country
      t.string :city
      t.string :street
      t.integer :zipcode
      t.integer :number

      t.timestamps
    end
  end
end
