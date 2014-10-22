class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :login
      t.date :date_of_birth

      t.timestamps
    end
  end
end
