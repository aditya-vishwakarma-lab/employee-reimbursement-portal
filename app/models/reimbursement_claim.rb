class ReimbursementClaim < ApplicationRecord
  validates :amount, numericality: { greater_than_or_equal_to: 0, message: "must be a positive number" }
  belongs_to :employee
  has_one :company, through: :employee
  has_one_attached :receipt
end
