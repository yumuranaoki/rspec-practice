class RenameFirsrNameColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :firsr_name, :first_name
  end
end
