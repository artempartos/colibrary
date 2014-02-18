class Book < ActiveRecord::Base
  belongs_to :company, inverse_of: :books
  belongs_to :owner, class_name: "User", inverse_of: :books
  has_many :paper_books
  has_many :e_books
end
