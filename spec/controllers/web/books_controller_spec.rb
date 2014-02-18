require 'spec_helper'

describe Web::BooksController do
  before :each do
    sign_in_as_user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "returns http redirect" do
      book_attributes = attributes_for :book
      post :create, book: book_attributes
      expect(response).to be_redirect

      book = current_company.books.where(isbn: book_attributes[:isbn])
      expect(book).to be_present
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      book = create :book, company_id: current_company.id
      get :show, id: book.id
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      book = create :book, company_id: current_company.id
      get :edit, id: book.id
      expect(response).to be_success
    end
  end

  describe "PUT 'update'" do
    it "returns http redirect" do
      book = create :book, company_id: current_company.id
      new_attributes = attributes_for(:book).slice(:title)
      put :update, id: book.id, book: new_attributes
      expect(response).to be_redirect
      book.reload
      expect(book.title).to eq(new_attributes[:title])
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http redirect" do
      book = create :book, company_id: current_company.id
      delete :destroy, id: book.id
      expect(response).to be_redirect
    end
  end

end
