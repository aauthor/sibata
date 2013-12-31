class AddNoteToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :note, :string
  end
end
