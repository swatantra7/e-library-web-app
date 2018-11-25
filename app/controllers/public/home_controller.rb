module Public

  class HomeController < PublicController

    def index
      @subjects = Subject.all
      @books = Book.all
    end

  end

end
