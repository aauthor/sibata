class Tab < ActiveRecord::Base

  validates_uniqueness_of :first_name, scope: :last_name, message: 'this tab name is already taken'
  has_many :line_items, dependent: :destroy
  belongs_to :user

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
    "#{last_name}, #{first_name}"
  end

  def name
    to_s
  end

  def self.last_update
    maximum( :updated_at )
  end

end
