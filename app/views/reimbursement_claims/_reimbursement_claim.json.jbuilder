json.extract! reimbursement_claim, :id, :employee_id, :purpose, :amount, :date_of_expenditure, :receipt_url, :created_at, :updated_at
json.url reimbursement_claim_url(reimbursement_claim, format: :json)
