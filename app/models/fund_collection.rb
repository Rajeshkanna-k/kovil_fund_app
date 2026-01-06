class FundCollection < ApplicationRecord
  enum payment_mode: { cash: 0, phonepe: 1 }

  validates :name, :area, :amount, presence: true
end
