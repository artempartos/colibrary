module Concerns
  module AuthManagement

    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      reset_session
    end

    def signed_in?
      !guest?
    end

    def guest?
      current_user.guest?
    end

    def current_user
      @current_user ||= User.active.where(id: session[:user_id]).first || Guest.new
    end

    def authenticate_user!
      redirect_to new_session_path unless signed_in?
    end
  end
end
