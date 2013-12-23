class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :tab, index: true
      t.float :amount

      t.timestamps
    end
  end
end
