class UserSignInType
  include ApplicationTypeWithoutActiveRecord

  attribute :email, String
  attribute :password, String

  validates :email, presence: true, email: true
  validates :password, presence: true

  validate :check_authenticate, if: :email

  def user
    ::User.active.where(email: email).first
  end

  private

  def check_authenticate
    unless user.try(:authenticate, password)
      errors.add(:password, :email_or_password_invalid)
    end
  end
end
