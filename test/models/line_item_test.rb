require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

  test "should not save line item without amount" do
    line_item = LineItem.new
    assert !line_item.save, "Saved the line item without a amount"
  end

  test 'should touch tab on update or addition' do
    line_item = line_items :one
    tab = line_item.tab
    old_time = tab.updated_at
    new_line_item = LineItem.new amount: 1337
    tab.line_items << new_line_item
    tab.reload
    assert tab.updated_at > old_time
  end

end
