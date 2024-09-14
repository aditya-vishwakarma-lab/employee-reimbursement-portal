class Company < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :employees, dependent: :destroy
  has_many :reimbursement_claims, through: :employees

  def employee_count
    employees.count
  end

  def total_reimbursement_claims
    employees.joins(:reimbursement_claims).sum('reimbursement_claims.amount')
  end
end
