require 'spec_helper'

describe Web::UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      attrs = attributes_for :user
      post :create, user: attrs
      expect(response).to be_redirect

      user = User.where(email: attrs[:email]).first
      expect(user).to be_present
    end
  end

  describe "GET 'confirm'" do
    it "returns http success" do
      requested_user = create :requested_user
      get 'confirm', id: requested_user.id, confirmation_token: requested_user.confirmation_token
      expect(response).to be_redirect

      requested_user.reload
      expect(requested_user.active?).to be_true
    end
  end
end
