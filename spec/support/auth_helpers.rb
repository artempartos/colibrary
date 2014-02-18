module AuthHelpers
  def sign_in_as_user
    @user = create :base_user
    sign_in @user
  end
end
