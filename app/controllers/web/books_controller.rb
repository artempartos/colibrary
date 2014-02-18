class Web::BooksController < Web::ApplicationController

  def index
    @books = current_company.books
    respond_with(@books)
  end

  def new
    @book = current_company.books.build.becomes(ManageBooksType)
    respond_with @book
  end

  def create
    @book = ManageBooksType.new
    @book.company = current_company
    @book.owner = current_user
    @book.assign_attributes(params[:book])
    @book.save
    respond_with @book
  end

  def show
    @book = current_company.books.find(params[:id])
    respond_with @book
  end

  def edit
    @book = current_company.books.find(params[:id]).becomes(ManageBooksType)
    respond_with @book
  end

  def update
    @book = current_company.books.find(params[:id]).becomes(ManageBooksType)
    @book.assign_attributes(params[:book])
    @book.save
    respond_with @book
  end

  def destroy
    @book = current_company.books.find(params[:id])
    @book.delete
    respond_with(@book)
  end
end
