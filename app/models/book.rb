class Book < ActiveRecord::Base
  belongs_to :company
  has_many :paper_books
end
