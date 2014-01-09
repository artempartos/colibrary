class Web::ApplicationController < ApplicationController
  respond_to :html
  layout -> { signed_in? ? "application" : "promo" }
end
