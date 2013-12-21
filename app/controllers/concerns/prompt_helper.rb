module Concerns
  module PromptHelper

    def prompt_path
      session[:return_to] = url_for()
    end

    def back_or_default(default = root_path)
      back = if params[:return_to].present?
               params[:return_to]
             elsif session[:return_to].present?
               session.delete(:return_to)
             # elsif request.env['HTTP_REFERER'].present? && request.env['HTTP_REFERER'] != request.env['REQUEST_URI']
             #   :back
             end

      back || default
    end
  end
end
