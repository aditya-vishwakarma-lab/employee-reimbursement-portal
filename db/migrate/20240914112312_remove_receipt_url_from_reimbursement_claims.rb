class RemoveReceiptUrlFromReimbursementClaims < ActiveRecord::Migration[7.1]
  def change
    remove_column :reimbursement_claims, :receipt_url, :string
  end
end
