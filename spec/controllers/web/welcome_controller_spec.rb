require 'spec_helper'

describe Web::WelcomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

end
