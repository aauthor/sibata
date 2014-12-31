class Tab < ActiveRecord::Base

  validates_uniqueness_of :last_name, scope: [:first_name, :note],
    message: ' - this tab name is already taken; change the first name or add a note'
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
    str = "#{last_name}, #{first_name}"
    str += " (#{note})" if note.present?
    str
  end

  def name
    to_s
  end

  def self.last_update
    maximum( :updated_at )
  end

end
