class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable


  def only_if_unconfirmed
    pending_any_confirmation { yield }
  end

  def has_no_password?
    self.encrypted_password.blank?
  end

  def attempt_set_password(params)
    password_attributes = {}
    password_attributes[:password] = params[:password]
    password_attributes[:password_confirmation] = params[:password_confirmation]
    update_attributes(password_attributes)
  end

  protected

  def password_required?
    confirmed? ? super : false
  end


end
