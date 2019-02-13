json.extract! transaction, :id, :company_id, :company_name, :user_id, :user_email, :payroll_id, :from_id, :from_address, :currency_id, :amount, :notes, :settled_at, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
