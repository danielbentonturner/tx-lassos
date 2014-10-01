class MyRegistrationController < Devise::RegistrationsController
  def create
    user = User.new(user_params)
     # name: user_params[:name],
     #  password: params[:password],
     #  password_confirmation: params[:password_confirmation],
     #  pledge_class: params[:pledge_class]
    user.skip_confirmation_notification!
    user.save!
    redirect_to new_user_session_path, flash: {
      :notice => "Your registration is pending approval by an administrator. You will receive an e-mail once approved."
    }
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :pledge_class)
  end
end