class ApplicationController < ActionController::Base
  include Concerns::FlashHelper
  include Concerns::PromptHelper
  protect_from_forgery with: :exception
end
