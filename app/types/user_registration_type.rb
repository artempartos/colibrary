class UserRegistrationType < User
  include ApplicationType
  validates :email, presence: true, uniqueness: true, email: true

  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  permit :email, :password, :first_name, :last_name, :avatar, :password_confirmation

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase.to_s)
  end
end
