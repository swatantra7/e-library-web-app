module Public
  class SubjectsController < ApplicationController

    before_action :find_subject

    def books
      @books = @subject.books
    end

    private

    def find_subject
      @subject = Subject.find(params[:id])
    end

  end
end
