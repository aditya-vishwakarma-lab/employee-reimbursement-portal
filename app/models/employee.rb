class Employee < ApplicationRecord
  validates :name, presence: true
  belongs_to :company
  has_many :reimbursement_claims, dependent: :destory
end
