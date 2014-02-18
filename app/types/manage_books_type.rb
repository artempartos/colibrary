class ManageBooksType < Book
  include ApplicationType
  validates :title, presence: true

  permit :isbn, :title, :publisher, :cover, :remove_cover, :details
  
end
