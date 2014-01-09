class UserRegistrationType < User
  include ApplicationType
  accepts_nested_attributes_for :companies

  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  permit :email, :password, :first_name, :last_name, :avatar, :password_confirmation,
         :companies_attributes => [:name]

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase.to_s)
  end
end
