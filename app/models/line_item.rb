class LineItem < ActiveRecord::Base
  belongs_to :tab

  validates :amount, presence: true

  DEFAULT_AMOUNTS = [1, 4, 4.5, 5, 5.5, 6]

  def self.default_amounts
    DEFAULT_AMOUNTS
  end
end
