class Company < ActiveRecord::Base
  has_many :employees, inverse_of: :company, dependent: :destroy
  has_many :users, through: :employees
  validates :name, presence: true
end
