class Employment < ApplicationRecord
  belongs_to :company
  belongs_to :user, inverse_of: :employments
end
