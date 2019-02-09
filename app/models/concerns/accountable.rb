module Accountable
  extend ActiveSupport::Concern

  included do
    has_many :accounts, :as => :accountable
  end
end