class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, email: true
  has_secure_password
  include UserRepository

  state_machine initial: :inactive do
    state :active
    state :inactive

    event :activate do
      transition :inactive => :active
    end

    event :disactivate do
      transition :active => :inactive
    end
  end

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm
    assign_attributes(confirmation_token: nil)
    activate
  end
end
