require 'test_helper'

class TabTest < ActiveSupport::TestCase
  test '#balance should return the outstanding balance' do
    t = tabs(:one)
    t.add! 5
    assert t.balance == 5
  end
  test '#closed? should report if tab is closed' do
    closed_tab = tabs(:one)
    open_tab = tabs(:with_line_items)
    assert closed_tab.closed?
    assert !open_tab.closed?
  end
  test '#open? should report if tab is open' do
    closed_tab = tabs(:one)
    open_tab = tabs(:with_line_items)
    assert !closed_tab.open?
    assert open_tab.open?
  end
  test '#close! should close the tab' do
    t = tabs(:one)
    t.add! 5
    t.close!
    assert t.balance == 0
  end
  test '.last_update should get the last update' do
    t = tabs :one
    assert Tab.last_update == t.updated_at
  end
end
