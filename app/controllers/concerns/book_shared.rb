module BookShared
  extend ActiveSupport::Concern

  def index
    @books = Book.all.order(updated_at: :desc)
  end

end