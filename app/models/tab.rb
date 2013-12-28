class Tab < ActiveRecord::Base

  has_many :line_items, dependent: :destroy

  def add!(amount)
    line_items << LineItem.new( amount: amount )
  end

  def subtract!(amount)
    add!(-amount)
  end

  def balance
    line_items.sum(:amount)
  end

  def open?
    balance > 0
  end

  def closed?
    !open?
  end

  def close!
    subtract! balance if open?
  end

  def to_s
    name
  end

end
