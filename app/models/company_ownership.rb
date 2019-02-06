class CompanyOwnership < ApplicationRecord
  belongs_to :admin
  belongs_to :company, inverse_of: :company_ownerships
end
