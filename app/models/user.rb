class User < ActiveRecord::Base
  has_secure_password

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
end
