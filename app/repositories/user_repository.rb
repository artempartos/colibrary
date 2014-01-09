module UserRepository
  extend ActiveSupport::Concern

  included do
    scope :active, -> {with_states([:active])}
  end
end
