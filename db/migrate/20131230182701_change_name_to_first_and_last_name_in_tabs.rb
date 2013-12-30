class ChangeNameToFirstAndLastNameInTabs < ActiveRecord::Migration
  def up
    rename_column :tabs, :name, :last_name
    add_column :tabs, :first_name, :string
  end
  def down
    remove_column :tabs, :first_name
    rename_column :tabs, :last_name, :name
  end
end
