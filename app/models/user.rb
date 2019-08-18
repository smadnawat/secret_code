class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :code
  validates :email, uniqueness: true
  validate :validate_code, on: :create
  has_one :secret_code, dependent: :nullify
  has_one :role, dependent: :destroy
  
  after_create :update_code, :update_role
  
  def validate_code
  	_code = SecretCode.fresh.find_by_code(code)
		errors.add(:code, "is invalid") unless _code.present?
  end
  def update_code
  	SecretCode.find_by(code: code).update(user_id: id)
  end
  def update_role
    create_role(type_of: "member")
  end
  def admin?
    role&.admin?
  end
end
