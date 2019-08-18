class SecretCode < ApplicationRecord
  belongs_to :user, optional: true
  scope :fresh, -> {where(user_id:nil)}
  scope :assigned, -> {where.not(user_id:nil)}

  def self.generate(num)
  	num.times{ create(code: (SecureRandom.hex 3)) }
  end
end
