class ConfirmationsController < Devise::ConfirmationsController

  # skip_before_action :require_no_authentication
  # skip_before_action :authenticate_student!

  def update
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        @confirmable.attempt_set_password(params[:student])
        if @confirmable.valid?
          do_confirm
        else
          do_show
          @confirmable.errors.clear
        end
      else
        @confirmable.errors.add(:email, :password_already_set)
      end
    end

    if !@confirmable.errors.empty?
      render 'devise/confirmations/new'
    end
  end

  def show
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        do_show
      else
        do_confirm
      end
    end
    unless @confirmable.errors.empty?
      self.resource = @confirmable
      render 'devise/confirmations/new'
    end
  end

  protected

  def with_unconfirmed_confirmable
    @confirmable = Student.find_or_initialize_with_error_by(:confirmation_token, params[:confirmation_token])
    if !@confirmable.new_record?
      @confirmable.only_if_unconfirmed { yield }
    end
  end

  def do_show
    @confirmation_token = params[:confirmation_token]
    @requires_password = true
    self.resource = @confirmable
    render 'student/confirmation/show'
  end

  def do_confirm
    set_flash_message :notice, :confirmed
    sign_in_and_redirect(resource_name, @confirmable)
  end

  def after_confirmation_path_for(resource_name, resource)
    token = resource.send(:set_reset_password_token)
    admin_students_path
  end


end