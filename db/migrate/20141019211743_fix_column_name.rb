class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :companies, :type, :type_enum
  end
end
