class Company < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :employees, dependent: :destroy
  has_many :reimbursement_claims, through: :employees
end
