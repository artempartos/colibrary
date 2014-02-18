class Company < ActiveRecord::Base
  has_many :employees, inverse_of: :company, dependent: :destroy
  has_many :users, through: :employees
  has_many :books, inverse_of: :company
  validates :name, presence: true
end
