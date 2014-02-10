class Book < ActiveRecord::Base
  belongs_to :company
  has_many :paper_books
  has_many :e_books
end
