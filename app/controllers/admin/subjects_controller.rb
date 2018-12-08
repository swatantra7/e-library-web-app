module Admin
  
  class SubjectsController < AdminController

    before_action :find_subject, only: [:edit, :show, :update]

    def index
      @subjects  = Subject.all
    end

    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.new(subject_params)
      if @subject.save
        respond_to do |format|
          format.js
        end
      else
        render 'new'
      end
    end

    def update
      if @subject.update_attributes(subject_params)
        redirect_to admin_subjects_path
      else
        render 'edit'
        flash[:alert] = 'Subject Not Updated'
      end
    end

    private

    def subject_params
      params.require(:subject).permit(
        :name,
        :images
      )
    end

    def find_subject
      @subject = Subject.find(params[:id])
    end

  end

end
