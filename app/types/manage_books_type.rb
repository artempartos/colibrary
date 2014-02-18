class ManageBooksType < Book
  include ApplicationType
  validates :title, presence: true

  permit :isbn, :title, :publisher, :cover, :details
  
end
