require 'spec_helper'

describe Web::SessionsController do
  before :each do
    @user = create :base_user
  end

  describe "login page" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "signin user" do
    it "returns http success" do
      args = { email: @user.email, password: @user.password }
      post :create, user_sign_in_type: args
      expect(response).to be_redirect
    end
  end

  describe "sign out" do
    it "returns http success" do
      delete :destroy
      expect(response).to be_redirect
    end
  end

end
