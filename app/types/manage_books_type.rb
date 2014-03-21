class ManageBooksType < Book
  include ApplicationType
  validates :title, :author, presence: true

  permit :author, :cover, :details, :isbn, :publisher, :remove_cover, :title
end
