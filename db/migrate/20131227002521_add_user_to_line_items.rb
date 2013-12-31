class AddUserToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :user_id, :integer
    add_column :tabs, :user_id, :integer
  end
end
