class UserRmvPasswordSalt < ActiveRecord::Migration
  def change
    remove_column :users, :password_salt
  end
end
