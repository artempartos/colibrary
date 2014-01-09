class ApplicationController < ActionController::Base
  include Concerns::AuthManagement
  include Concerns::FlashHelper
  include Concerns::PromptHelper
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user
end
