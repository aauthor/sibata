require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

  test "should not save line item without amount" do
    line_item = LineItem.new
    assert !line_item.save, "Saved the line item without a amount"
  end

end
