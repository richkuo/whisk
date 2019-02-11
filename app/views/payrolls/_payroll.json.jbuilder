json.extract! payroll, :id, :admin_id, :company_id, :notes, :batch_number, :pay_period, :created_at, :updated_at
json.url payroll_url(payroll, format: :json)
