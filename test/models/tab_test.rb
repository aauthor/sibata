require 'test_helper'

class TabTest < ActiveSupport::TestCase
  test 'balance should return the outstanding balance' do
    t = tabs(:one)
    t.add! 5
    assert t.balance == 5
  end
  # test "the truth" do
  #   assert true
  # end
end
