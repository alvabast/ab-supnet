class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :token
      t.integer :valid_seconds

      t.timestamps
    end
  end
end
