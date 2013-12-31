class AddNoteToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :note, :string
  end
end
