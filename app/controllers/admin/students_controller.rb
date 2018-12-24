class Admin::StudentsController < AdminController

  before_action :find_student, only: [:edit, :update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(students_params)
    if @student.save
      redirect_to admin_students_path
    else
      render 'new'
    end
  end

  def update
    if @student.update_attributes(students_params)
      redirect_to admin_students_path
    else
      render 'edit'
    end
  end

  private

  def students_params
    params.require(:student).permit(:email, :password, :name)
  end

  def find_student
    @student = Student.find(params[:id])
  end

end
