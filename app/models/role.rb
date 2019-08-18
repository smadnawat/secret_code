class Role < ApplicationRecord
  belongs_to :user

  enum type_of: [:admin, :member]
end
