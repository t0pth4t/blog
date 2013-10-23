# app/controllers/users/password_controller.rb

class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
  private :resource_params
end