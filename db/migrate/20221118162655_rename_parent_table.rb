class RenameParentTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :parents_tables, :parents
  end
end
